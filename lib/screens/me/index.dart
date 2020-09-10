import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:qaf_flutter/components/modal_login.dart';

import 'package:qaf_flutter/components/title_page.dart';
import 'package:qaf_flutter/components/menu_group.dart';
import 'package:qaf_flutter/components/menu_item.dart';
import 'package:qaf_flutter/components/menu_one.dart';
import 'package:qaf_flutter/screens/me-login/index.dart';

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
        child: SizedBox(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TitlePage(title: '帐户'),
                MenuOne(
                  showIconRight: false,
                  active: true,
                  title: '登录/注册',
                  action: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => MeLoginScreen()));
                    // showCupertinoModalBottomSheet(
                    //   expand: true,
                    //   backgroundColor: Colors.transparent,
                    //   context: context,
                    //   builder: (context, scrollController) => ModalLogin(),
                    // );
                    showMaterialModalBottomSheet(
                      expand: true,
                      duration: Duration(milliseconds: 300),
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context, scrollController) => ModalLogin(),
                    );
                  },
                ),
                MenuOne(
                  showIconRight: true,
                  title: '通知',
                  action: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MeLoginScreen()));
                  },
                ),
                MenuGroup(children: [
                  MenuItem(
                    showBorderBottom: true,
                    title: '和朋友分享',
                    action: () {
                      print('我是action');
                    },
                  ),
                  MenuItem(
                    showBorderBottom: true,
                    title: '意见反馈',
                    action: () {
                      print('我是action');
                    },
                  ),
                  MenuItem(
                    showBorderBottom: false,
                    title: '关于我们',
                    action: () {
                      print('我是action');
                    },
                  ),
                ])
                // MenuGroup(children: [
                //   MenuItem(
                //     showBorderBottom: true,
                //     title: '账户设置',
                //     action: () {
                //       print('我是action');
                //     },
                //   ),
                //   MenuItem(
                //     showBorderBottom: true,
                //     title: '权限管理',
                //     action: () {
                //       print('我是action');
                //     },
                //   ),
                //   MenuItem(
                //     title: '通知',
                //     action: () {
                //       print('我是action');
                //     },
                //   )
                // ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuSingle {}
