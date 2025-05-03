import 'package:flutter/material.dart';
import 'package:quiz/answer.dart';
import 'package:quiz/question.dart';

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

  void asnwer() {
    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> answers =
        hasQuestion ? questions[questionIndex]['answers'] as List<String> : [];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Perguntas e Respostas')),
        body:
            hasQuestion
                ? Column(
                  children: [
                    Question(questions[questionIndex]['question'] as String),
                    ...answers.map((answerText) => Answer(answerText, asnwer)),
                  ],
                )
                : Center(
                  child: Text(
                    "Você já respondeu todas as perguntas. Obrigado pela participação",
                    style: TextStyle(fontSize: 28),
                  ),
                ),
      ),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  QuizAppState createState() => QuizAppState();
}
