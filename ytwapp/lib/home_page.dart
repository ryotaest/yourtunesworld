import 'package:flutter/material.dart';
import 'package:YourTunesWorld/pages/friendList_page.dart.dart';
import 'package:YourTunesWorld/pages/global_page.dart';
import 'package:YourTunesWorld/pages/home.dart';
import 'package:YourTunesWorld/pages/my_page.dart';
import 'package:YourTunesWorld/pages/notification_page.dart';
import 'package:YourTunesWorld/pages/search_page.dart';
import 'package:YourTunesWorld/pages/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _navigationBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const Home(),
    const MyPage(),
    const Global(),
    const Search(),
    const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0
          ? AppBar(
              title: Row(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 45,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Your Tunes World',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              centerTitle: false,
              backgroundColor: Colors.white,
              iconTheme: const IconThemeData(color: Colors.black),
              elevation: 0.0,
              actions: [
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationPage(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.people),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FriendList(),
                      ),
                    );
                  },
                ),
              ],
            )
          : null,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _navigationBottomBar,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.home), label: 'Home'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.person), label: 'MyPage'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/logo.png',
                  height: 30,
                ),
                label: 'Global'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.search), label: 'Search'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ]),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}
