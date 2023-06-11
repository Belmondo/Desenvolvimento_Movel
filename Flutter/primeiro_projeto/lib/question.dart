import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  String textQuestion = "";

  Question(String text) {
    this.textQuestion = text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      child: Text(
        textQuestion,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
