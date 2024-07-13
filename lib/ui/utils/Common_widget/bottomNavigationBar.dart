import 'package:chat_app/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/ui/chats.dart';
import 'package:chat_app/ui/setting.dart';

class Bnb extends StatefulWidget {
  const Bnb({super.key});

  @override
  State<Bnb> createState() => _BnbState();
}

class _BnbState extends State<Bnb> {
  int _selectedIndex = 0;

  static const List<Widget>  widgetList = <Widget>[
    Chats(),
    Home(),
    Setting(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6D5F9A),
      body:  widgetList[_selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline_outlined, size: 30),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline, size: 30),
              label: 'Person',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu, size: 30),
              label: 'Menu',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0XFFEFA985),
          unselectedItemColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Color(0xFF4D426D),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

