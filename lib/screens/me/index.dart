import 'package:flutter/material.dart';
import 'package:qaf_flutter/components/menu_group.dart';
import 'package:qaf_flutter/components/menu_item.dart';
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
                active: true,
                title: '登录',
                action: () {
                  print('我是action');
                },
              ),
              MenuGroup(children: [
                MenuItem(
                  showBorderBottom: true,
                  title: '账户设置',
                  action: () {
                    print('我是action');
                  },
                ),
                MenuItem(
                  showBorderBottom: true,
                  title: '权限管理',
                  action: () {
                    print('我是action');
                  },
                ),
                MenuItem(
                  title: '通知',
                  action: () {
                    print('我是action');
                  },
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}

class MenuSingle {}
