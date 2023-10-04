import 'package:flutter/material.dart';

class RetornoAPI extends StatelessWidget {
  String textQuestion = "";

  RetornoAPI(String text) {
    this.textQuestion = text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: textQuestion,
        ),
      ),
    );
  }
}
