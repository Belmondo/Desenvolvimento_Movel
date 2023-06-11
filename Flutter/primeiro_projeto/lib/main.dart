import 'package:flutter/material.dart';
import 'package:primeiro_projeto/answers.dart';
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
            new Answers('First Answer', answer),
            new Answers('Second Answer', answer),
            new Answers('Third Answer', answer)
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
