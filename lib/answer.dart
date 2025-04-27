import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String text;
  final void Function()? onSelected;

  const Answer(this.text, this.onSelected, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onSelected,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        child: Text(text),
      ),
    );
  }
}
