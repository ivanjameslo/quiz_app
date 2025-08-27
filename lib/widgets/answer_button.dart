import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answer, this.onTap, {super.key});

  final String answer;
  final void Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
      child: ElevatedButton(
        onPressed: () {
          onTap(answer);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 214, 214, 151),
          foregroundColor: Colors.black,
          padding: const EdgeInsets.all(10),
        ),
        child: Text(
          answer,
          style: const TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}