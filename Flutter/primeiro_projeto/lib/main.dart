import 'package:flutter/material.dart';

main() {
  runApp(new PrimeiraAplicacao());
}

class PrimeiraAplicacao extends StatelessWidget {
  var perguntaAtual = 0;

  final perguntas = [
    "Qual a sua cor favorita?",
    "Qual sua camisa favorita?",
    "Qual a sua música favorista?"
  ];

  void cliqueAqui() {
    perguntaAtual++;
    print(perguntas[perguntaAtual]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Olá Flutter'),
        ),
        body: Column(
          children: [
            Text(perguntas[perguntaAtual]),
            ElevatedButton(
              onPressed: cliqueAqui,
              child: Text("Resposta 1"),
            ),
            ElevatedButton(
              onPressed: cliqueAqui,
              child: Text("Resposta 2"),
            ),
            ElevatedButton(
              onPressed: cliqueAqui,
              child: Text("Resposta 3"),
            )
          ],
        ),
      ),
    );
  }
}