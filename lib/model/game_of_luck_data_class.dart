import 'package:flutter/material.dart';

class GameOfLuckDataClass {
  bool isBoxClicked = false;
  String yourFortune = '';
  int randomIndex = 0;
  Color boxColor = Colors.greenAccent;
  Color boxBorderColor = Colors.green;
  final List textList = [
    'You are amazing!',
    'You can do it!',
    'Good morning!',
    'You made it!',
    'Have a great day!',
    'Avada kedavra!!!',
    'Don\'t worry...',
    'You are the best!',
    'Do better!',
    'How you doing!',
    'Be a good person!',
    'Avada kedavra!!!',
  ];

  GameOfLuckDataClass({
    required this.isBoxClicked,
    required this.yourFortune,
    required this.randomIndex,
    required this.boxColor,
    required this.boxBorderColor,
  });
}
