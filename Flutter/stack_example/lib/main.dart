import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyAppWidget(),
    );
  }
}

class MyAppWidget extends StatefulWidget {
  const MyAppWidget({Key? key}) : super(key: key);

  @override
  _MyAppWidgetState createState() => _MyAppWidgetState();
}

class _MyAppWidgetState extends State<MyAppWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Cor de fundo da AppBar
        title: Text('Aula de Stack'), // Título da AppBar
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Image(
              image: NetworkImage(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            //posicionar o texto na base a esquerda
            Positioned(
              bottom: 15.0,
              left: 20.0,
              child: Text(
                "Aula de Dev. para plataformas Móveis",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
                    color: Colors.black),
              ),
            ),
            Positioned(
              top: 100,
              left: 240.0,
              child: ElevatedButton(
                onPressed: null,
                child: Text('botão'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
