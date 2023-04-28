import 'package:flutter/material.dart';

void main() {
  runApp(const MyQuiz());
}

class MyQuiz extends StatelessWidget {
  const MyQuiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Le Quizz',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Découvre ton niveau en ...'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        backgroundColor: Colors.blueGrey,
        body: Container(
          child: Column(

          ),
        ),
      ),
    );
  }
}
