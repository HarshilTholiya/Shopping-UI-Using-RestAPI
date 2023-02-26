import 'package:flutter/material.dart';
import 'package:mobile_app/mobile.dart';
import 'package:mobile_app/mobile_2.dart';
import 'package:mobile_app/shopping.dart';

class BottomNavigationBarCustom extends StatefulWidget {
  const BottomNavigationBarCustom({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarCustom> createState() =>
      _BottomNavigationBarCustomState();
}

class _BottomNavigationBarCustomState extends State<BottomNavigationBarCustom> {
  int selectedIndex = 0;
  List<Widget> widgetsList = [
    MobileApp(),
    Shopping(),
    Center(
      child: Container(
        child: Text("Bottom Navigatoin Bar Item 2 "),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetsList[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Start Shopping',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings ')
        ],
        selectedItemColor: Colors.black,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(
            () {
              selectedIndex = index;
            },
          );
        },
      ),
    );
  }
}
