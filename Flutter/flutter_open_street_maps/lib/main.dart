import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_osm/CustomMarker.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testando Open Street Maps',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Testando Open Street Maps'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final MapController mapController;
  late LocationData currentLocation;
  double? lat;
  double? long;
  Set<Marker> markers = {};
  final Icon markerIcon = Icon(
    Icons.pin_drop,
    color: Colors.blue,
    size: 48,
  );

  List<LatLng> routpoints = [LatLng(52.05884, -1.345583)];

  @override
  void initState() {
    mapController = MapController();
    getCurrentLocation();
    super.initState();
  }

  void getCurrentLocation() async {
    var location = Location();
    print(location);
    currentLocation = await location.getLocation();
    lat = currentLocation.latitude;
    print(lat);
    long = currentLocation.longitude;
    print(long);
    setState(() {
      mapController.move(
        LatLng(lat!, long!),
        13.0,
      );
    });
  }

  void addMarker(LatLng point) async {
    markers.clear();
    final marker = CustomMarker(
      point: point,
      icon: markerIcon,
    );
    var longFinal = point.longitude;
    var latFinal = point.latitude;
    var url = Uri.parse(
        'http://router.project-osrm.org/route/v1/driving/$long,$lat;$longFinal,$latFinal?steps=true&annotations=true&geometries=geojson&overview=full');
    var response = await http.get(url);
    print(response.body);
    setState(() {
      markers.add(marker);
      routpoints = [];
      var ruter =
          jsonDecode(response.body)['routes'][0]['geometry']['coordinates'];
      for (int i = 0; i < ruter.length; i++) {
        var reep = ruter[i].toString();
        reep = reep.replaceAll("[", "");
        reep = reep.replaceAll("]", "");
        var lat1 = reep.split(',');
        var long1 = reep.split(",");
        routpoints.add(LatLng(double.parse(lat1[1]), double.parse(long1[0])));
      }
      print(routpoints);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Testando Open Street Maps'),
        ),
        body: Stack(
          children: [
            FlutterMap(
              options: MapOptions(
                center: LatLng(51.509364, -0.128928),
                zoom: 13.0,
                onTap: (tapPosition, point) {
                  print(point);
                  addMarker(point);
                },
              ),
              mapController: mapController,
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                ),
                MarkerLayer(
                  markers: markers.toList(),
                ),
                PolylineLayer(
                  polylineCulling: false,
                  polylines: [
                    Polyline(
                        points: routpoints, color: Colors.blue, strokeWidth: 9)
                  ],
                )
              ],
            ),
          ],
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    ); //Material App
  }
}
