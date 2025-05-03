import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final void Function() restart;

  const Result(this.score, this.restart, {super.key});

  String get textResult {
    if (score < 25) {
      return 'Você conseguiu uma boa pontuação';
    } else {
      return 'Tente novamente';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text(textResult, style: TextStyle(fontSize: 28))),
        ElevatedButton(
          onPressed: restart,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Text('Reiniciar'),
        ),
      ],
    );
  }
}
