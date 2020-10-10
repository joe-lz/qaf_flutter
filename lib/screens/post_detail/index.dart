// 话题内容列表
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class PostDetailScreen extends StatefulWidget {
  PostDetailScreen({Key key}) : super(key: key);

  @override
  _PostDetailScreenState createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          // leading: CupertinoButton(
          //   padding: EdgeInsets.all(0),
          //   child: Text(
          //     'actions.cancel'.tr(),
          //     style: TextStyle(
          //       fontSize: Theme.of(context).textTheme.bodyText1.fontSize,
          //       color: Theme.of(context).primaryColor,
          //     ),
          //   ),
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //   },
          // ),
          leading: Container(),
          // middle: Text(
          //   'me_menus.messages'.tr(),
          //   style: Theme.of(context).textTheme.bodyText1,
          // ),
          trailing: CupertinoButton(
            padding: EdgeInsets.all(0),
            child: Text(
              'actions.cancel'.tr(),
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodyText1.fontSize,
                color: Theme.of(context).primaryColor,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: Theme.of(context).canvasColor,
        ),
        child: Container(
          // color: Theme.of(context).scaffoldBackgroundColor,
          child: Text('cdfklmk'),
        ),
      ),
    );
  }
}
