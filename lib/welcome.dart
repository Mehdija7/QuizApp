import 'package:flutter/material.dart';

void onClick() {}

class Welcome extends StatelessWidget {
  const Welcome(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: const Color.fromARGB(125, 250, 251, 252),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Learn Flutter the fun way!',
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(
          height: 20,
        ),
        OutlinedButton.icon(
            onPressed: () {
              startQuiz();
            },
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz')),
      ],
    ));
  }
}
