import 'package:flutter/material.dart';
import 'package:quiz_app/questions_page.dart';
import 'package:quiz_app/welcome.dart';
import './data/questions.dart';
import './results_page.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> {
  List<String> selectedAnswers = [];
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = Welcome(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = Questions(onSelectAnswer: chooseAnswer);
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = Questions(onSelectAnswer: chooseAnswer);
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = Results(
          selectedAnswers,
          onRestart: restartQuiz,
        );
      });
    }
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
              decoration:
                  const BoxDecoration(color: Color.fromARGB(255, 113, 66, 196)),
              child: activeScreen)),
    );
  }
}
