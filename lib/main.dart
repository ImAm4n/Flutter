import 'package:flutter/material.dart';
import 'package:have_fun/screen0.dart';
import 'package:have_fun/screen1.dart';
import 'package:have_fun/screen2.dart';

void main() {
  runApp(const MyFunApp());
}

class MyFunApp extends StatelessWidget {
  const MyFunApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fun App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyBottomNavBar(),
    );
  }
}

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    OverviewScreen(title: 'Home'),
    Wallpaper(title: 'Wallpaper'),
    FortuneBox(title: 'Game of Luck')
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amberAccent,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Overview',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Wallpaper',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.gamepad),
            label: 'Game',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
