import 'package:flutter/material.dart';

import 'package:instagram_ui_clone/home_page.dart';
import 'package:instagram_ui_clone/account_page.dart';
import 'package:instagram_ui_clone/search_page.dart';

import 'package:firebase_auth/firebase_auth.dart';

class TabPage extends StatefulWidget {
  final User user;
  TabPage(this.user);

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedIndex = 0;

  late List _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(widget.user),
      SearchPage(widget.user),
      AccountPage(widget.user),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.black,
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.account_circle),
              label: 'Account',
            ),
          ]),
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}
