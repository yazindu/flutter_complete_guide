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
  final _questions = const [
    {
      'question': 'What\'s your favourite color?',
      'answers': ['Black', 'Red', 'Green', 'White']
    },
    {
      'question': 'What\'s your favourite animal?',
      'answers': ['Rabbit', 'Snake', 'Dog', 'Cat']
    },
    {
      'question': 'Who\'s your favourite instructor?',
      'answers': ['Max', 'Mux', 'Musk', 'Mix']
    }
  ];

  void _answerQuestion() {
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
            : Result(),
      ),
    );
  }
}
