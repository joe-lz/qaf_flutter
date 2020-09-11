import 'package:flutter/material.dart';
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
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(DefaultPadding, DefaultPadding / 2, DefaultPadding, DefaultPadding / 2),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(RadiusNormal)),
          child: Container(
            color: Colors.white,
            height: MenuHeight * 2,
            width: ScreenUtils.screenW(context) - DefaultPadding * 2,
            child: Column(
              children: [
                Text('username'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
