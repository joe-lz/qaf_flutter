import 'package:flutter/material.dart';
import 'package:qaf_flutter/screens/home/index.dart';
import 'package:qaf_flutter/screens/message/index.dart';
import 'package:qaf_flutter/screens/me/index.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // List<Widget> pages = new List();
  // @override
  // void initState() {
  //   pages..add(HomeScreen())..add(MessageScreen())..add(MeScreen());
  // }

  // final List<Widget> pages = [HomeScreen(), MessageScreen(), MeScreen()];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   //导航栏
      //   title: Text("App Name"),
      // ),
      // body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(icon: Icon(Icons.message), title: Text('信息')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('我')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }
}
