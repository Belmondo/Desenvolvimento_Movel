import 'package:flutter/material.dart';

void main() {
  runApp(ConsomeApiApp());
}

class ConsomeApiApp extends StatefulWidget {
  const ConsomeApiApp({super.key});
  ConsomeApiState createState() {
    return ConsomeApiState();
  }
}

class ConsomeApiState extends State<ConsomeApiApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Consumindo API'),
        ),
        body: Column(
          children: <Widget>[
            new TextField(),
            new ElevatedButton(onPressed: null, child: Text("Digite Algo")),
            new TextField(),
          ],
        ),
      ),
    );
  }
}
