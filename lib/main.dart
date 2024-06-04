import 'dart:math';

import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String myJankenText = '👊';
  String computerJankenText = '👊';

  List<String> jankenList = ['👊', '✌️', '✋'];

  void chooseComputerText() {
    final random = Random();
    final randomNumber = random.nextInt(3);
    final hand = jankenList[randomNumber];

    setState(() {
      computerJankenText = hand;
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
                computerJankenText,
                style: TextStyle(fontSize: 100),
              ),
              SizedBox(
                height: 80,
              ),
              Text(
                '自分',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                myJankenText,
                style: TextStyle(fontSize: 200),
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  myJankenText = '👊';
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
                  myJankenText = '✌️';
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
                  myJankenText = '✋';
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
