import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:qaf_flutter/components/modal_login.dart';

import 'package:qaf_flutter/components/page_title.dart';
import 'package:qaf_flutter/components/menu_group.dart';
import 'package:qaf_flutter/components/menu_item/index.dart';
import 'package:qaf_flutter/components/menu_one.dart';
import 'package:qaf_flutter/constants.dart';
import 'package:qaf_flutter/screens/me-about/index.dart';
import 'package:qaf_flutter/screens/me/userinfo.dart';
import 'package:qaf_flutter/screens/webview/index.dart';
import 'package:qaf_flutter/utils/screen_utils.dart';

class MeScreen extends StatefulWidget {
  @override
  _MeScreenState createState() => _MeScreenState();
}

class _MeScreenState extends State<MeScreen> {
  LCUser _currentUser;

  @override
  void initState() {
    super.initState();
    getCurrent();
  }

  void getCurrent() async {
    LCUser currentUser = await LCUser.getCurrent();
    setState(() {
      _currentUser = currentUser;
    });
  }

  void navigateToUserInfo() {
    showCupertinoModalBottomSheet(
      expand: true,
      duration: Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context, scrollController) => UserInfo(
        userinfo: _currentUser,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Container(
      child: SafeArea(
        top: true,
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              PageTitle(
                title: '帐户',
                right: _currentUser != null
                    ? GestureDetector(
                        onTap: () {
                          navigateToUserInfo();
                        },
                        child: Icon(
                          Icons.account_circle,
                          size: 35,
                          color: kPrimaryColor,
                        ),
                      )
                    : null,
              ),
              _currentUser != null
                  ? Container(
                      child: null,
                    )
                  : MenuOne(
                      showIconRight: false,
                      type: 'active',
                      title: '登录/注册',
                      action: () {
                        showMaterialModalBottomSheet(
                          expand: true,
                          duration: Duration(milliseconds: 300),
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context, scrollController) => ModalLogin(),
                        );
                      },
                    ),
              _currentUser != null
                  ? MenuOne(
                      title: '我的资料',
                      colorTitle: kPrimaryColor,
                      showIconRight: false,
                      type: 'active',
                      action: () {
                        navigateToUserInfo();
                      },
                    )
                  : Container(
                      child: null,
                    ),
              _currentUser != null
                  ? MenuGroup(
                      children: [
                        MenuItem(
                          // showBorderBottom: true,
                          title: '权限管理',
                          action: () {
                            print('我是action');
                          },
                        ),
                      ],
                    )
                  : Container(
                      child: null,
                    ),
              // MenuOne(
              //   showIconRight: true,
              //   title: '通知',
              //   action: () {
              //     Navigator.push(context, MaterialPageRoute(builder: (context) => MeLoginScreen()));
              //   },
              // ),
              MenuGroup(children: [
                MenuItem(
                  showBorderBottom: true,
                  showIconRight: true,
                  title: '和朋友分享',
                  action: () {
                    print('我是action');
                  },
                ),
                MenuItem(
                  showBorderBottom: true,
                  showIconRight: true,
                  title: '意见反馈',
                  action: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => WebviewScreen(url: 'https://support.qq.com/products/105926')));
                  },
                ),
                MenuItem(
                  showBorderBottom: false,
                  showIconRight: true,
                  title: '关于我们',
                  action: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MeAboutScreen()));
                  },
                ),
              ]),
              _currentUser != null
                  ? MenuOne(
                      showIconRight: false,
                      type: 'active',
                      colorTitle: kColorError,
                      title: '退出登录',
                      action: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return CupertinoActionSheet(
                              // title: Text('提示'),
                              message: Text('确认退出登录状态吗？'),
                              actions: <Widget>[
                                // CupertinoActionSheetAction(
                                //   child: Text('删除'),
                                //   onPressed: () {},
                                //   isDefaultAction: true,
                                // ),
                                CupertinoActionSheetAction(
                                  child: Text('退出登录'),
                                  onPressed: () async {
                                    await LCUser.logout();
                                    Navigator.pop(context, 'Cancel');
                                  },
                                  // isDestructiveAction: true,
                                ),
                              ],
                              cancelButton: CupertinoActionSheetAction(
                                child: Text('取消'),
                                isDestructiveAction: true,
                                // isDefaultAction: true,
                                onPressed: () {
                                  Navigator.pop(context, 'Cancel');
                                },
                              ),
                            );
                          },
                        );
                      },
                    )
                  : Container(
                      child: null,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuSingle {}
