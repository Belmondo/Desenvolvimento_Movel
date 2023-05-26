import 'package:flutter/material.dart';

main() {
  runApp(const QuestionApp());
}

class QuestionApp extends StatelessWidget {
  const QuestionApp({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> perguntas = [
      "What's your favorite color?",
      "What's your favorite animal?",
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Questions'),
        ),
        body: Column(
          children: <Widget>[
            Text(perguntas[0]),
            const ElevatedButton(
              onPressed: null,
              child: Text('First Answer'),
            )
          ],
        ),
      ),
    ); //Material App
  }
}
