import 'package:flutter/material.dart';
import 'package:quiz/answer.dart';
import 'package:quiz/question.dart';

class Questionary extends StatelessWidget {
  final int questionIndex;
  final List<Map<String, Object>> questions;
  final void Function(int) answer;

  const Questionary({
    required this.questionIndex,
    required this.questions,
    required this.answer,
    super.key,
  });

  bool get hasQuestion {
    return questionIndex < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers =
        hasQuestion
            ? questions[questionIndex]['answers'] as List<Map<String, Object>>
            : [];

    return Column(
      children: [
        Question(questions[questionIndex]['question'] as String),
        ...answers.map(
          (answerItem) => Answer(
            answerItem['text'] as String,
            () => answer(int.parse(answerItem['score'].toString())),
          ),
        ),
      ],
    );
  }
}
