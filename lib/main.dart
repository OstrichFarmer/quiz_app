import './answer.dart';
import './question.dart';
import './result.dart';
import 'package:flutter/material.dart';
import './quiz.dart';
import 'dart:core';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'what\'s your favorite color?',
      'answers': [
        {'text': 'Blue', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Yellow', 'score': 7},
        {'text': 'Black', 'score': 9},
      ]
    },
    {
      'questionText': 'what\'s your favorite pet?',
      'answers': [
        {'text': 'Dog', 'score': 9},
        {'text': 'Cat', 'score': 10},
        {'text': 'Goat', 'score': 7},
        {'text': 'Rabbit', 'score': 9},
      ]
    },
    {
      'questionText': 'who\'s your favorite Instructor?',
      'answers': [
        {'text': 'John', 'score': 7},
        {'text': 'Joel', 'score': 10},
        {'text': 'Bryan', 'score': 5},
        {'text': 'Shawn', 'score': 9},
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print("There is more questions");
    } else {
      print("No more questions");
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent[700],
          title: Text('Inertia'),
        ),
        body: (_questionIndex < _questions.length)
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
