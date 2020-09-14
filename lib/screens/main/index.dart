import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qaf_flutter/constants.dart';
import 'package:qaf_flutter/provider/global.dart';

import 'package:qaf_flutter/screens/home/index.dart';
import 'package:qaf_flutter/screens/message/index.dart';
import 'package:qaf_flutter/screens/me/index.dart';
import 'package:qaf_flutter/utils/screen_utils.dart';

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
    super.initState();
    pages..add(HomeScreen())..add(MessageScreen())..add(MeScreen());
    // pages..add(HomeScreen())..add(MeScreen());
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   //导航栏
      //   title: Text("App Name"),
      // ),
      body: Container(
        color: GlobalModel().getTheme().kBackgroundColor,
        width: ScreenUtils.screenW(context),
        height: ScreenUtils.screenH(context) + 100,
        child: pages[_selectedIndex],
      ),
      bottomNavigationBar: ClipRRect(
        // borderRadius: BorderRadius.only(
        //   topRight: Radius.circular(40),
        //   topLeft: Radius.circular(40),
        // ),
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
            backgroundColor: GlobalModel().getTheme().kTabbarBgColor,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.perm_media), title: Text('动态')),
              BottomNavigationBarItem(icon: Icon(Icons.category), title: Text('发现')),
              BottomNavigationBarItem(icon: Icon(Icons.recent_actors), title: Text('账户')),
            ],
            currentIndex: _selectedIndex,
            // fixedColor: Colors.deepPurple,
            selectedItemColor: kPrimaryColor,
            unselectedItemColor: kDisabledColor,
            onTap: _onItemTapped,
            iconSize: 24,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            elevation: 0,
          ),
        ),
      ),
    );
  }
}
