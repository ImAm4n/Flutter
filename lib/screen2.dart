import 'dart:math';

import 'package:flutter/material.dart';
import 'package:have_fun/model/game_of_luck_data_class.dart';

class FortuneBox extends StatefulWidget {
  const FortuneBox({super.key, required this.title});

  final String title;

  @override
  State<FortuneBox> createState() => _FortuneBoxState();
}

class _FortuneBoxState extends State<FortuneBox> {
  final GameOfLuckDataClass _dataClass = GameOfLuckDataClass(
    isBoxClicked: false,
    yourFortune: '',
    randomIndex: 0,
    boxColor: Colors.greenAccent,
    boxBorderColor: Colors.green,
  );

  void _onFloatingButtonClickListener() {
    setState(() {
      _dataClass.isBoxClicked = false;
      _dataClass.randomIndex = 0;
      _dataClass.boxColor = Colors.greenAccent;
      _dataClass.boxBorderColor = Colors.green;
      _dataClass.yourFortune = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 10.0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/wallpaper_6.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ColumnGameBox(dataClass: _dataClass),
            ColumnGameBox(dataClass: _dataClass),
            ColumnGameBox(dataClass: _dataClass),
            ColumnGameBox(dataClass: _dataClass),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onFloatingButtonClickListener,
        tooltip: 'Reset box to default',
        child: const Icon(Icons.restore),
      ),
    );
  }
}

class RowGameBox extends StatefulWidget {
  const RowGameBox({super.key, required this.dataClass});
  final GameOfLuckDataClass dataClass;

  @override
  State<RowGameBox> createState() => _RowGameBoxState();
}

class _RowGameBoxState extends State<RowGameBox> {
  final Random _random = Random();

  void _onBoxClickListener() {
    setState(() {
      widget.dataClass.isBoxClicked = true;
      widget.dataClass.randomIndex = _random.nextInt(12);
    });

    if (widget.dataClass.isBoxClicked) {
      widget.dataClass.yourFortune =
          widget.dataClass.textList[widget.dataClass.randomIndex];
    } else {
      widget.dataClass.yourFortune = '';
    }
    if (widget.dataClass.yourFortune == 'Avada kedavra!!!') {
      widget.dataClass.boxColor = Colors.redAccent;
      widget.dataClass.boxBorderColor = Colors.red;
    } else {
      widget.dataClass.boxColor = Colors.greenAccent;
      widget.dataClass.boxBorderColor = Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onBoxClickListener,
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: widget.dataClass.boxColor,
          border: Border(
              top: BorderSide(
                  style: BorderStyle.solid,
                  color: widget.dataClass.boxBorderColor),
              bottom: BorderSide(
                  style: BorderStyle.solid,
                  color: widget.dataClass.boxBorderColor),
              left: BorderSide(
                  style: BorderStyle.solid,
                  color: widget.dataClass.boxBorderColor),
              right: BorderSide(
                  style: BorderStyle.solid,
                  color: widget.dataClass.boxBorderColor)),
        ),
        child: Center(
          child: Text(
            widget.dataClass.yourFortune,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class ColumnGameBox extends StatelessWidget {
  const ColumnGameBox({super.key, required this.dataClass});
  final GameOfLuckDataClass dataClass;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RowGameBox(dataClass: dataClass),
        RowGameBox(dataClass: dataClass),
        RowGameBox(dataClass: dataClass),
      ],
    );
  }
}
