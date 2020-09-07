import 'package:flutter/material.dart';
import 'package:qaf_flutter/screens/home/index.dart';
import 'package:qaf_flutter/screens/message/index.dart';
import 'package:qaf_flutter/screens/me/index.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> pages = new List();
  @override
  void initState() {
    pages..add(HomeScreen())..add(MessageScreen())..add(MeScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        //导航栏
        title: Text("App Name"),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
        child: Container(
          decoration: BoxDecoration(
              // borderRadius: BorderRadius.only(
              //   topRight: Radius.circular(40),
              //   topLeft: Radius.circular(40),
              // ),
              // color: Colors.red,
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.grey,
              //   ),
              // ],
              ),
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
              BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('信息')),
              BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('我')),
            ],
            currentIndex: _selectedIndex,
            fixedColor: Colors.deepPurple,
            onTap: _onItemTapped,
            iconSize: 24,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            elevation: 0,
            backgroundColor: Color.fromRGBO(0, 0, 0, 0.05),
          ),
        ),
      ),
    );
  }
}
