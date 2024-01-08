import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StratScreen extends StatelessWidget {
  const StratScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset("assets/images/quiz-logo.png",
            width: 300, color: const Color.fromARGB(150, 255, 255, 255)),
        //Opacity(
        //    opacity: 0.8,
        //    child: Image.asset("assets/images/quiz-logo.png", width: 300)),
        const SizedBox(height: 40),
        Text("learn flutter the fun way!",
            style: GoogleFonts.roboto(fontSize: 24, color: Colors.white)),
        const SizedBox(height: 20),
        OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)))),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text("start quiz"))
      ]),
    );
  }
}
