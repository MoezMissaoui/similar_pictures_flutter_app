import 'dart:math';

import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: const Text(
          "Similar Pictures Game",
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo[800],
      ),
      body: const ImagePage(),
    );
  }
}

class ImagePage extends StatefulWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  int leftImageNumber = 1;
  int rightImageNumber = 2;
  int score = 0;
  String gameMessage = "Press To Play";

  void changeImageRandomly() {
    setState(() {
      rightImageNumber = Random().nextInt(8) + 1;
      leftImageNumber = Random().nextInt(8) + 1;
      score = (rightImageNumber == leftImageNumber) ? score += 1 : score;
      gameMessage = (leftImageNumber == rightImageNumber)
          ? "Congrat Success"
          : "Try Again";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Score : $score",
          style: const TextStyle(fontSize: 30.0, color: Colors.white),
        ),
        Text(
          gameMessage,
          style: const TextStyle(fontSize: 40.0, color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    changeImageRandomly();
                  },
                  child: Image.asset('images/img-$leftImageNumber.png'),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    changeImageRandomly();
                  },
                  child: Image.asset('images/img-$rightImageNumber.png'),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
