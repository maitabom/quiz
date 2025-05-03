import 'package:flutter/material.dart';
import 'package:quiz/questionary.dart';
import 'package:quiz/result.dart';

void main() {
  runApp(QuizApp());
}

class QuizAppState extends State<QuizApp> {
  var questionIndex = 0;
  var totalScore = 0;

  final List<Map<String, Object>> questions = const [
    {
      'question': 'Qual é a capital da França?',
      'answers': [
        {'text': 'Paris', 'score': 10},
        {'text': 'Londres', 'score': 0},
        {'text': 'Berlim', 'score': 0},
        {'text': 'Madrid', 'score': 0},
      ],
    },
    {
      'question': 'Qual é a capital da Alemanha?',
      'answers': [
        {'text': 'Londres', 'score': 0},
        {'text': 'Paris', 'score': 0},
        {'text': 'Berlim', 'score': 10},
        {'text': 'Madrid', 'score': 0},
      ],
    },
    {
      'question': 'Qual é a capital da Espanha?',
      'answers': [
        {'text': 'Paris', 'score': 0},
        {'text': 'Madrid', 'score': 10},
        {'text': 'Berlim', 'score': 0},
        {'text': 'Londres', 'score': 0},
      ],
    },
    {
      'question': 'Qual é a sua cor favorita?',
      'answers': [
        {'text': 'Vermelho', 'score': 10},
        {'text': 'Verde', 'score': 8},
        {'text': 'Azul', 'score': 6},
        {'text': 'Amarelo', 'score': 4},
      ],
    },
    {
      'question': 'Qual é o seu animal favorito?',
      'answers': [
        {'text': 'Gato', 'score': 8},
        {'text': 'Peixe', 'score': 4},
        {'text': 'Cachorro', 'score': 10},
        {'text': 'Pássaro', 'score': 6},
      ],
    },
    {
      'question': 'Qual é o seu esporte favorito?',
      'answers': [
        {'text': 'Natação', 'score': 4},
        {'text': 'Basquete', 'score': 8},
        {'text': 'Futebol', 'score': 10},
        {'text': 'Vôlei', 'score': 6},
      ],
    },
    {
      'question': 'Qual é a sua comida favorita?',
      'answers': [
        {'text': 'Sushi', 'score': 6},
        {'text': 'Pizza', 'score': 10},
        {'text': 'Salada', 'score': 4},
        {'text': 'Hambúrguer', 'score': 8},
      ],
    },
  ];

  bool get hasQuestion {
    return questionIndex < questions.length;
  }

  void answer(int score) {
    setState(() {
      questionIndex++;
      totalScore += score;
    });
  }

  void restart() {
    setState(() {
      questionIndex = 0;
      totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Perguntas e Respostas')),
        body:
            hasQuestion
                ? Questionary(
                  questionIndex: questionIndex,
                  questions: questions,
                  answer: answer,
                )
                : Result(totalScore, restart),
      ),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  QuizAppState createState() => QuizAppState();
}
