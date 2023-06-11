import 'package:flutter/material.dart';
import 'package:primeiro_projeto/question.dart';

main() {
  runApp(QuestionApp());
}

class QuestionAppState extends State<QuestionApp> {
  var perguntaSelecionada = 0;

  void answer() {
    setState(() {
      perguntaSelecionada++;
    });
    print(perguntaSelecionada);
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
            new Question(perguntas[perguntaSelecionada]),
            ElevatedButton(
              child: Text('First Answer'),
              onPressed: answer,
            ),
            ElevatedButton(
              child: Text('Second Answer'),
              onPressed: answer,
            ),
            ElevatedButton(
              child: Text('Third Answer'),
              onPressed: answer,
            )
          ],
        ),
      ),
    ); //Material App
  }
}

class QuestionApp extends StatefulWidget {
  const QuestionApp({super.key});

  QuestionAppState createState() {
    return QuestionAppState();
  }
}
