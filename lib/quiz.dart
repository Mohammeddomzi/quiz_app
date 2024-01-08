import 'package:flutter/material.dart';
import 'package:quiz_app/data/Questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  // ignore: no_logic_in_create_state
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = "start";
  List<String> selectedAnswers = [];
  // @override
  // void initState() {
  //   activeScreen = StratScreen(switchScreens);
  //   super.initState();
  // }

  void switchScreens() {
    setState(() {
      activeScreen = "questions";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "result";
      });
    }
  }

  void restart() {
    setState(() {
      selectedAnswers = [];
      activeScreen = "questions";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StratScreen(switchScreens);
    if (activeScreen == "questions") {
      screenWidget = QuestionsScreen(chooseAnswer);
    }
    if (activeScreen == "result") {
      screenWidget = ResultScreen(selectedAnswers, restart);
    }

    return MaterialApp(
        home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 49, 1, 72),
          Color.fromARGB(255, 91, 1, 109),
        ], begin: Alignment.bottomRight, end: Alignment.topLeft)),
        child: screenWidget,
      ),
    ));
  }
}
