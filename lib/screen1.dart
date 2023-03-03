import 'package:flutter/material.dart';

class Wallpaper extends StatefulWidget {
  const Wallpaper({super.key, required this.title});

  final String title;

  @override
  State<Wallpaper> createState() => _WallpaperState();
}

class _WallpaperState extends State<Wallpaper> {
  int _listIndex = 0;
  static const List _imagesList = [
    'assets/images/wallpaper_1.jpg',
    'assets/images/wallpaper_2.jpg',
    'assets/images/wallpaper_3.jpg',
    'assets/images/wallpaper_4.jpg',
    'assets/images/wallpaper_6.jpg',
    'assets/images/wallpaper_7.jpg',
    'assets/images/wallpaper_8.jpg',
    'assets/images/wallpaper_9.jpg',
  ];

  void _incrementListIndex() {
    setState(() {
      if (_listIndex < _imagesList.length - 1) {
        _listIndex++;
      } else {
        _listIndex = 0;
      }
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
        child: null,
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(_imagesList[_listIndex]), fit: BoxFit.cover),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementListIndex,
        tooltip: 'Change Wallpaper',
        child: const Icon(Icons.next_plan_outlined),
      ),
    );
  }
}
