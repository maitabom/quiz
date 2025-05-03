import 'package:flutter/material.dart';
import 'package:quiz/questionary.dart';
import 'package:quiz/result.dart';

void main() {
  runApp(QuizApp());
}

class QuizAppState extends State<QuizApp> {
  var questionIndex = 0;

  final List<Map<String, Object>> questions = const [
    {
      'question': 'Qual é a capital da França?',
      'answers': ['Paris', 'Londres', 'Berlim', 'Roma'],
    },
    {
      'question': 'Qual é a capital da Alemanha?',
      'answers': ['Paris', 'Berlim', 'Madrid', 'Lisboa'],
    },
    {
      'question': 'Qual é a capital da Espanha?',
      'answers': ['Madrid', 'Paris', 'Lisboa', 'Roma'],
    },
    {
      'question': 'Qual é a sua cor favorita?',
      'answers': ['Vermelho', 'Azul', 'Amarelo', 'Verde'],
    },
    {
      'question': 'Qual é o seu animal favorito?',
      'answers': ['Cachorro', 'Gato', 'Pássaro', 'Peixe'],
    },
    {
      'question': 'Qual é o seu esporte favorito?',
      'answers': ['Futebol', 'Basquete', 'Vôlei', 'Natação'],
    },
    {
      'question': 'Qual é a sua comida favorita?',
      'answers': ['Pizza', 'Hambúrguer', 'Sushi', 'Salada'],
    },
  ];

  bool get hasQuestion {
    return questionIndex < questions.length;
  }

  void answer() {
    setState(() {
      questionIndex++;
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
                : Result(),
      ),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  QuizAppState createState() => QuizAppState();
}
