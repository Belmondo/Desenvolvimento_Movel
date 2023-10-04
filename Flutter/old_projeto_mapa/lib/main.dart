import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

main() {
  runApp(MaterialApp(home: ConsomeApiApp()));
}

class ConsomeApiState extends State<ConsomeApiApp> {
  late MapController mapController;
  late LocationData currentLocation;
  double? lat;
  double? long;

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

  void addMarker(LatLng point) {
    setState(() {});
  }

  void takeAPicture() async {
    String imageURL = '';
    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
    ImagePicker imagePicker = new ImagePicker();
    XFile? image = await imagePicker.pickImage(source: ImageSource.camera);
    print(image?.path);

    if (image != null) {
      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceDirImages = referenceRoot.child('images');
      Reference referenceImageToUpload =
          referenceDirImages.child(uniqueFileName);

      try {
        await referenceImageToUpload.putFile(File(image.path));

        imageURL = await referenceImageToUpload.getDownloadURL();
      } catch (error) {
        print("Erro no upload");
      }
    }

/*
    setState(() {
      print("clicou para tirar foto");
    });
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Camera(),
      ),
    );
*/
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Consumindo API'),
        ),
        body: Stack(
          children: [
            FlutterMap(
              options: MapOptions(
                center: LatLng(51.509364, -0.128928),
                zoom: 13.0,
                onTap: (tapPosition, point) {
                  addMarker(point);
                },
              ),
              mapController: mapController,
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: takeAPicture,
          tooltip: 'Increment',
          child: const Icon(Icons.photo),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    ); //Material App
  }
}

class ConsomeApiApp extends StatefulWidget {
  const ConsomeApiApp({super.key});

  ConsomeApiState createState() {
    return ConsomeApiState();
  }
}
