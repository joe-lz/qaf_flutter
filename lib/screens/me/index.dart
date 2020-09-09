import 'package:flutter/material.dart';
import 'package:qaf_flutter/components/menu_group.dart';
import 'package:qaf_flutter/components/menu_one.dart';

class MeScreen extends StatefulWidget {
  @override
  _MeScreenState createState() => _MeScreenState();
}

class _MeScreenState extends State<MeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        top: true,
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              MenuOne(
                showIconRight: false,
                title: '登录',
                action: () {
                  print('我是action');
                },
              ),
              MenuOne(
                title: '通知',
                action: () {
                  print('我是action');
                },
              ),
              MenuGroup(menulist: [
                1, 2, 3
                // {title: '设置'},
                // {title: '账单'},
              ])
            ],
          ),
        ),
      ),
    );
  }
}

class MenuSingle {}
