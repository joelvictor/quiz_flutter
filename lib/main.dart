import 'package:flutter/material.dart';
import 'package:quiz_flutter/quiz.dart';
import 'package:quiz_flutter/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }

}

class _MyAppState extends State<MyApp> {

  final _questions = const [
    {
      "questionText": "What's your dad name?",
      "answers":[
        {
          "text":"Jonh","score":3.10
        },
        {
          "text":"Paul","score":5.0
        },
        {
          "text":"Steve","score":8.0
        }
      ]
    },
    {
      "questionText": "What's your mom name?",
      "answers":[
        {
          "text":"Tonya","score":3.10
        },
        {
          "text":"Ophra","score":5.0
        },
        {
          "text":"Emma","score":8.0
        }
      ]
    },
    {
      "questionText": "What's your dog name?",
      "answers":[
        {
          "text":"Rex","score":3.10
        },
        {
          "text":"Jim","score":5.0
        },
        {
          "text":"Phil","score":8.0
        }
      ]
    },
    {
      "questionText": "What's your prefered drink name?",
      "answers":[
        {
          "text":"Wine","score":3.10
        },
        {
          "text":"Vodka","score":5.0
        },
        {
          "text":"Tequila","score":8.0
        }
      ]
    }
  ];

  int _questionIndex = 0;
  double _total = 0;

  void _resetQuiz() {
    _questionIndex = 0;
    _total = 0;
  }

  void _answerQuestion(double score) {
    _total +=score;

    setState(() {
      _questionIndex +=1;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Quiz'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
          answerQuestion: _answerQuestion,
          questionIndex: _questionIndex,
          questions: _questions,
        )
            : Result(_total, _resetQuiz),
      ),
    );
  }

}