import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Dice'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int? leftDiceNumber;
  int? rightDiceNumber;

  int generateRandomNumber() => Random().nextInt(6) + 1; // 1 - 6

  void randomizeSynced() {
    setState(
          () {
        rightDiceNumber = generateRandomNumber();
        leftDiceNumber = generateRandomNumber();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    randomizeSynced();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: MaterialButton(
              onPressed: () => randomizeSynced(),
              child: Image.asset(
                'images/dice$leftDiceNumber.png',
              ),
            ),
          ),
          Expanded(
            child: MaterialButton(
              onPressed: () => randomizeSynced(),
              child: Image.asset(
                'images/dice$rightDiceNumber.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}