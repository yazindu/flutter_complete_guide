import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quiz.dart';
import 'package:flutter_complete_guide/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'question': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 6},
        {'text': 'Green', 'score': 5},
        {'text': 'White', 'score': 1}
      ]
    },
    {
      'question': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 5},
        {'text': 'Snake', 'score': 10},
        {'text': 'Dog', 'score': 1},
        {'text': 'Cat', 'score': 3},
      ]
    },
    {
      'question': 'Who\'s your favourite instructor?',
      'answers': [
        {'text': 'Max', 'score': 5},
        {'text': 'Mux', 'score': 10},
        {'text': 'Musk', 'score': 1},
        {'text': 'Mix', 'score': 8},
      ]
    }
  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      if (_questionIndex < _questions.length)
        _questionIndex++;
      else
        print('You did it!');
    });
    print('answer is chosen for' + _questionIndex.toString());
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
