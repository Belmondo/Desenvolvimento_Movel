import 'package:flutter/material.dart';

class MeuBotao extends StatelessWidget {
  String answerText;
  void Function() callingTheFunction;

  MeuBotao(this.answerText, this.callingTheFunction);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: callingTheFunction,
        child: Text(answerText),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}
