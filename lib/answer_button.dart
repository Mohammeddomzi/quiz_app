import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answer, this.onClick, {super.key});
  final String answer;
  final void Function() onClick;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
            // backgroundColor: const Color.fromARGB(255, 46, 1, 88),
            // foregroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10)),
        child: Text(
          answer,
          textAlign: TextAlign.center,
        ));
  }
}
