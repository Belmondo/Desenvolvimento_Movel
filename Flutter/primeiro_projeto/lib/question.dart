import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  String textQuestion = "";

  Question(String text) {
    this.textQuestion = text;
  }

  @override
  Widget build(BuildContext context) {
    return Text(textQuestion);
  }
}
