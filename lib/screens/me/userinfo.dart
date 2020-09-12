import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qaf_flutter/components/menu_group.dart';
import 'package:qaf_flutter/components/menu_item.dart';
import 'package:qaf_flutter/components/menu_one.dart';
import 'package:qaf_flutter/constants.dart';
import 'package:qaf_flutter/utils/screen_utils.dart';

class UserInfo extends StatefulWidget {
  UserInfo({
    Key key,
    this.userinfo,
  }) : super(key: key);
  final userinfo;

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(width: 0.5, color: kBorderColor),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Row(
                  children: [
                    CupertinoButton(
                      child: Text(
                        "取消",
                        style: TextStyle(
                          fontSize: kFontSizeNormal,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Expanded(
                      child: Container(
                        child: null,
                      ),
                    ),
                    CupertinoButton(
                      child: Text(
                        "编辑",
                        style: TextStyle(
                          fontSize: kFontSizeNormal,
                          // color: kDisabledColor,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, DefaultPadding, 0, 0),
                      child: Icon(
                        Icons.account_circle,
                        size: 80,
                        color: kDisabledColor,
                      ),
                    ),
                    MenuGroup(
                      title: '基本信息',
                      children: [
                        MenuItem(
                          showBorderBottom: true,
                          title: '用户名',
                          desc: widget.userinfo.username,
                          // descHint: '必填',
                        ),
                        MenuItem(
                          showBorderBottom: true,
                          title: '性别',
                          desc: null,
                          descHint: '必填',
                        ),
                        MenuItem(
                          showBorderBottom: true,
                          title: '年龄',
                          desc: null,
                          descHint: '必填',
                        ),
                        MenuItem(
                          showBorderBottom: true,
                          title: '身高',
                          desc: null,
                          descHint: '必填',
                        ),
                        MenuItem(
                          showBorderBottom: true,
                          title: '体重',
                          desc: null,
                          descHint: '必填',
                        ),
                      ],
                    ),
                    MenuGroup(
                      title: '个人资料',
                      children: [
                        MenuItem(
                          showBorderBottom: true,
                          title: '血型',
                          desc: null,
                          descHint: '-',
                        ),
                        MenuItem(
                          showBorderBottom: true,
                          title: '星座',
                          desc: null,
                          descHint: '-',
                        ),
                        MenuItem(
                          showBorderBottom: true,
                          title: '城市',
                          desc: null,
                          descHint: '-',
                        ),
                        MenuItem(
                          showBorderBottom: false,
                          title: '工作行业',
                          desc: null,
                          descHint: '-',
                        ),
                      ],
                    ),
                    MenuGroup(
                      title: '交友信息',
                      children: [
                        MenuItem(
                          showBorderBottom: true,
                          title: '角色',
                          desc: null,
                          descHint: '-',
                        ),
                        MenuItem(
                          showBorderBottom: true,
                          title: '情感状态',
                          desc: null,
                          descHint: '-',
                        ),
                        MenuItem(
                          showBorderBottom: true,
                          title: '交友目的',
                          desc: null,
                          descHint: '-',
                        ),
                        MenuItem(
                          showBorderBottom: true,
                          title: '体形',
                          desc: null,
                          descHint: '-',
                        ),
                      ],
                    ),
                    MenuOne(
                      title: '个人签名',
                      desc: null,
                      descHint: '-',
                      // showIconRight: true,
                      // type: 'disabled',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
