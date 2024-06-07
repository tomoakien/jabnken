import 'dart:math';

import 'package:flutter/material.dart';

import 'result_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const StartDisplay(title: 'jyanken start Page'),
    );
  }
}

class StartDisplay extends StatefulWidget {
  const StartDisplay({super.key, required this.title});

  final String title;

  @override
  State<StartDisplay> createState() => _StartDisplayState();
}

class _StartDisplayState extends State<StartDisplay> {
  Hand? myHand;
  Hand? computerHand;
  Result? result;

  void chooseComputerText() {
    final random = Random();
    final randomNumber = random.nextInt(3);
    final hand = Hand.values[randomNumber]; //enumになった

    setState(() {
      computerHand = hand; //hand型をStringに変換
    });
    decideResult(); //勝敗の処理
  }

  void decideResult() {
    //ジャンケンの結果を処理
    if (myHand == null || computerHand == null) {
      return; //
    }
    final Result result;

    if (myHand == computerHand) {
      result = Result.draw;
    } else if (myHand == Hand.rock && computerHand == Hand.scissors) {
      result = Result.win;
    } else if (myHand == Hand.scissors && computerHand == Hand.paper) {
      result = Result.win;
    } else if (myHand == Hand.paper && computerHand == Hand.rock) {
      result = Result.win;
    } else {
      result = Result.lose;
    }
    setState(() {
      this.result = result;
    });
  }

  void resetHandandResult() {
    setState(() {
      myHand = null;
      computerHand = null;
      result = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '相手',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                computerHand?.text ?? '?',
                style: TextStyle(fontSize: 100),
              ),
              SizedBox(
                height: 80,
              ),
              Text(
                result?.text ?? '?',
                style: TextStyle(fontSize: 50),
              ),
              SizedBox(
                height: 80,
              ),
              Text(
                '自分',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                myHand?.text ?? '?',
                style: TextStyle(fontSize: 100),
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultPage()),
                );
              },
              child: const Text(
                'result',
                style: TextStyle(fontSize: 15),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            FloatingActionButton(
              onPressed: () {
                resetHandandResult();
              },
              child: const Text(
                'reset',
                style: TextStyle(fontSize: 15),
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  myHand = Hand.rock;
                });
                chooseComputerText();
              },
              child: const Text(
                '👊',
                style: TextStyle(fontSize: 30),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  myHand = Hand.scissors;
                });
                chooseComputerText();
              },
              child: const Text(
                '✌️',
                style: TextStyle(fontSize: 30),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  myHand = Hand.paper;
                });
                chooseComputerText();
              },
              child: const Text(
                '✋',
                style: TextStyle(fontSize: 30),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        ));
  }
}

enum Hand {
  rock,
  scissors,
  paper; //最後の項目だけ,じゃなくて;なことに注意

  String get text {
    switch (this) {
      case Hand.rock:
        return '👊';
      case Hand.scissors:
        return '✌️';
      case Hand.paper:
        return '✋';
    }
  }
}

enum Result {
  win,
  lose,
  draw;

  String get text {
    switch (this) {
      case Result.win:
        return '勝ち';
      case Result.lose:
        return '負け';
      case Result.draw:
        return 'あいこ';
    }
  }
}
