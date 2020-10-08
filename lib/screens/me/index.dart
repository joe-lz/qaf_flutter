import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:qaf_flutter/provider/global.dart';

import 'package:qaf_flutter/provider/theme/colors.dart';
import 'package:qaf_flutter/provider/user.dart';
import 'package:qaf_flutter/provider/user_profile.dart';

import 'package:qaf_flutter/screens/me/userinfo.dart';
import 'package:qaf_flutter/components/modal_login.dart';
import 'package:qaf_flutter/components/page_title.dart';
import 'package:qaf_flutter/components/menu_group.dart';
import 'package:qaf_flutter/components/menu_item/index.dart';
import 'package:qaf_flutter/components/menu_one.dart';
import 'package:qaf_flutter/screens/webview/WebviewScreenArguments.dart';

class MeScreen extends StatefulWidget {
  @override
  _MeScreenState createState() => _MeScreenState();
}

class _MeScreenState extends State<MeScreen> {
  @override
  void initState() {
    super.initState();
    // context.read<UserModal>().getCurrentUser();
    context.read<UserProfileModal>().getMyUserProfile();
  }

  void navigateToUserInfo() {
    showCupertinoModalBottomSheet(
      // enableDrag: false,
      expand: true,
      duration: Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context, scrollController) => UserInfo(),
    );
  }

  @override
  Widget build(BuildContext context) {
    context.watch<GlobalModal>().setStatusBar();
    LCUser _currentUser = context.watch<UserModal>().currentUser;
    return Container(
      child: SafeArea(
        top: true,
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              PageTitle(
                title: 'tabbar.account'.tr(),
                right: _currentUser != null
                    ? GestureDetector(
                        onTap: () {
                          navigateToUserInfo();
                        },
                        child: Icon(
                          Icons.account_circle,
                          size: 35,
                          color: Theme.of(context).primaryColor,
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
                      // type: 'active',
                      title: 'actions.login'.tr(),
                      colorTitle: Theme.of(context).primaryColor,
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
                      title: 'me_menus.your_profile'.tr(),
                      colorTitle: Theme.of(context).primaryColor,
                      showIconRight: false,
                      // type: 'active',
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
                          title: 'me_menus.permisions'.tr(),
                          action: () {
                            print('我是action');
                          },
                        ),
                      ],
                    )
                  : Container(
                      child: null,
                    ),
              MenuGroup(children: [
                MenuItem(
                  showBorderBottom: true,
                  showIconRight: true,
                  title: 'me_menus.share'.tr(),
                  action: () {
                    print('我是action');
                  },
                ),
                MenuItem(
                  showBorderBottom: true,
                  showIconRight: true,
                  title: 'me_menus.feedback'.tr(),
                  action: () {
                    Navigator.pushNamed(context, "/webview", arguments: WebviewScreenArguments('https://support.qq.com/products/105926'));
                  },
                ),
                MenuItem(
                  showBorderBottom: false,
                  showIconRight: true,
                  title: 'me_menus.aboutus'.tr(),
                  action: () {
                    Navigator.pushNamed(context, "/me_about");
                  },
                ),
              ]),
              _currentUser != null
                  ? MenuOne(
                      showIconRight: false,
                      // type: 'active',
                      colorTitle: Colours().getColor().error_color,
                      title: 'actions.logout'.tr(),
                      titleCenter: true,
                      action: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return CupertinoActionSheet(
                              // title: Text('提示'),
                              message: Text('desc.logout'.tr()),
                              actions: <Widget>[
                                // CupertinoActionSheetAction(
                                //   child: Text('删除'),
                                //   onPressed: () {},
                                //   isDefaultAction: true,
                                // ),
                                CupertinoActionSheetAction(
                                  child: Text('actions.logout'.tr()),
                                  onPressed: () async {
                                    await context.read<UserModal>().handleLogout();
                                    Navigator.pop(context, 'Cancel');
                                  },
                                  // isDestructiveAction: true,
                                ),
                              ],
                              cancelButton: CupertinoActionSheetAction(
                                child: Text('actions.cancel'.tr()),
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
