import 'package:flutter/material.dart';

main() {
  runApp(QuestionApp());
}

class QuestionApp extends StatelessWidget {
  QuestionApp({super.key});

  void answer() {
    print('Questions Answered');
  }

  @override
  Widget build(BuildContext context) {
    final List<String> perguntas = [
      "What's your favorite color?",
      "What's your favorite animal?",
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Questions'),
        ),
        body: Column(
          children: <Widget>[
            Text(perguntas[0]),
            ElevatedButton(
              child: Text('First Answer'),
              onPressed: answer,
            )
          ],
        ),
      ),
    ); //Material App
  }
}
