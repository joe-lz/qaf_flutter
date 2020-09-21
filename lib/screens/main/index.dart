import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaf_flutter/provider/user.dart';
import 'package:easy_localization/easy_localization.dart';

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
    super.initState();
    pages..add(HomeScreen())..add(MessageScreen())..add(MeScreen());
    // pages..add(HomeScreen())..add(MeScreen());

    context.read<UserModal>().getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   //导航栏
      //   title: Text("App Name"),
      // ),
      // body: Container(
      //   // color: GlobalModel().getTheme().kBackgroundColor,
      //   width: ScreenUtils.screenW(context),
      //   height: ScreenUtils.screenH(context) + 100,
      //   child: pages[_selectedIndex],
      // ),
      // backgroundColor: Colors.transparent,
      body: pages[_selectedIndex],
      bottomNavigationBar: ClipRRect(
        // borderRadius: BorderRadius.only(
        //   topRight: Radius.circular(40),
        //   topLeft: Radius.circular(40),
        // ),
        child: Container(
          // decoration: BoxDecoration(
          //     // borderRadius: BorderRadius.only(
          //     //   topRight: Radius.circular(40),
          //     //   topLeft: Radius.circular(40),
          //     // ),
          //     // color: Colors.red,
          //     // boxShadow: [
          //     //   BoxShadow(
          //     //     color: Colors.grey,
          //     //   ),
          //     // ],
          //     ),
          child: BottomNavigationBar(
            // backgroundColor: GlobalModel().getTheme().kTabbarBgColor,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.aspect_ratio), title: Text('tabbar.posts').tr()),
              BottomNavigationBarItem(icon: Icon(Icons.explore), title: Text('tabbar.discover').tr()),
              BottomNavigationBarItem(icon: Icon(Icons.input), title: Text('tabbar.account').tr()),
            ],
            currentIndex: _selectedIndex,
            // fixedColor: Colors.deepPurple,
            // selectedItemColor: kPrimaryColor,
            // unselectedItemColor: kDisabledColor,
            onTap: _onItemTapped,
            iconSize: 22,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            // showUnselectedLabels: false,
            // showSelectedLabels: false,
            elevation: 0,
          ),
        ),
      ),
    );
  }
}
