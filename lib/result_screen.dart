import 'package:flutter/material.dart';
import 'package:quiz_app/data/Questions.dart';
import 'package:quiz_app/summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.answersList, this.restart, {super.key});

  final void Function() restart;
  final List<String> answersList;

  List<Map<String, Object>> getsummary() {
    List<Map<String, String>> summary = [];
    for (var i = 0; i < answersList.length; i++) {
      summary.add({
        "question_index": (i + 1).toString(),
        "Question": questions[i].text,
        "Correct Answer": questions[i].answers[0],
        "Your answer": answersList[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summary = getsummary();
    final numOfTotal = questions.length;
    final numOfCorrect = summary.where((data) {
      return data["Correct Answer"] == data["Your answer"];
    }).length;

    return Container(
        width: double.infinity,
        margin: const EdgeInsets.all(40),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("You answered $numOfCorrect out of $numOfTotal",
                style: const TextStyle(color: Colors.white, fontSize: 20)),
            const SizedBox(height: 20),
            Summary(summary),
            const SizedBox(height: 30),
            TextButton(onPressed: restart, child: const Text("Restart Quiz"))
          ]),
        ));
  }
}
