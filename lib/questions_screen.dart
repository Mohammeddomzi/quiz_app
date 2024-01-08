import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/Questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.chooseAnswer, {super.key});

  final void Function(String answer) chooseAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var questionIndex = 0;

  void switchQ(String answer) {
    widget.chooseAnswer(answer);
    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQ = questions[questionIndex];
    return Container(
      margin: const EdgeInsets.all(40),
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(currentQ.text,
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 201, 134, 221),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center),
              const SizedBox(height: 20),
              ...currentQ.shuffleAnswers().map((answer) {
                return AnswerButton(answer, () {
                  switchQ(answer);
                });
              })
            ]),
      ),
    );
  }
}
