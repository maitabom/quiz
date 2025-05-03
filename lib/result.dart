import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;

  const Result(this.score, {super.key});

  String get textResult {
    if (score < 25) {
      return 'Você conseguiu uma boa pontuação';
    } else {
      return 'Tente novamente';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(textResult, style: TextStyle(fontSize: 28)));
  }
}
