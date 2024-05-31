import 'package:apk/login.dart';
import 'package:apk/mes%20pages/publication.dart';
import 'package:flutter/material.dart';
import 'mes pages/mainpage.dart';
import 'mes pages/settings.dart';

class NaviagtionPage extends StatefulWidget {
  NaviagtionPage({super.key});

  @override
  State<NaviagtionPage> createState() => _NaviagtionPageState();
}

class _NaviagtionPageState extends State<NaviagtionPage> {
  @override
  int currentindex = 0;
  List<Widget> screen = [
    const Mymainpage(),
    const Publications(),
    const Settings(),
  ];
  void _listbotton(int index) {
    currentindex = index;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D2E33),
      body: Container(),
      bottomSheet: screen[currentindex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black54,
          unselectedItemColor: Colors.black,
          currentIndex: currentindex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              currentindex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                (Icons.home),
                size: 20,
              ),
              label: 'Home',
            ),
             BottomNavigationBarItem(
              icon: Icon(
                (Icons.group_add),
                size: 20,
              ),
              label: 'Comptes',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                (Icons.settings),
                size: 20,
              ),
              label: 'Parametres',
            ),
          ]),
    );
  }
}
