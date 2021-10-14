import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore >= 30) {
      resultText = 'you have such a great choice';
    } else if (resultScore >= 25) {
      resultText = 'Your choices are cool';
    } else if (resultScore >= 20) {
      resultText = 'You have quite a low choice';
    } else {
      resultText = 'What kind of choices do you even make';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
              onPressed: resetHandler,
              child: Text('Restart'),
              style: ElevatedButton.styleFrom(primary: Colors.greenAccent[700]))
        ],
      ),
    );
  }
}
