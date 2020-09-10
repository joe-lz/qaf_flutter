import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:qaf_flutter/components/input_item.dart';
import 'package:qaf_flutter/constants.dart';
import 'package:qaf_flutter/utils/screen_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CardLogin extends StatefulWidget {
  CardLogin({
    Key key,
    this.cardKey,
  }) : super(key: key);
  final cardKey;

  @override
  _CardLoginState createState() => _CardLoginState();
}

class _CardLoginState extends State<CardLogin> {
  String username;
  String password;

  void handleLogin() async {
    try {
      if (username != null && password != null) {
        // 登录成功
        LCUser user = await LCUser.login(username, password);
        Fluttertoast.showToast(
          msg: "登录成功",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else {
        Fluttertoast.showToast(
          msg: '请输入用户名和密码',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } on LCException catch (e) {
      // 登录失败（可能是密码错误）
      print('${e.code} : ${e.message}');
      Fluttertoast.showToast(
        msg: '${e.code} : ${e.message}',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(RadiusLarge)),
      child: Container(
        color: Colors.white,
        width: ScreenUtils.screenW(context) - DefaultPadding * 2,
        // height: 400,
        child: Padding(
          padding: EdgeInsets.fromLTRB(DefaultPadding * 2, DefaultPadding, DefaultPadding * 2, DefaultPadding),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: kBackgroundColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.close,
                        color: kPrimaryColor,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
              InputItem(
                labelText: "用户名",
                hintText: "用户名",
                prefixIcon: Icon(Icons.person),
                onChanged: (text) {
                  setState(() {
                    username = text;
                  });
                },
              ),
              InputItem(
                labelText: "密码",
                hintText: "您的登录密码",
                prefixIcon: Icon(Icons.lock),
                obscureText: true,
                onChanged: (text) {
                  setState(() {
                    password = text;
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, DefaultPadding, 0, DefaultPadding),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(RadiusNormal)),
                  child: Container(
                    width: 300,
                    height: 50,
                    color: kPrimaryColor,
                    child: Material(
                      color: kPrimaryColor,
                      child: InkWell(
                        onTap: () {
                          handleLogin();
                        },
                        child: Row(
                          children: [
                            Expanded(child: Container(child: null)),
                            Text(
                              '登录',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Expanded(child: Container(child: null)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, DefaultPadding),
                child: Row(
                  children: [
                    Expanded(child: Container(child: null)),
                    Text('还没有帐户？'),
                    GestureDetector(
                      onTap: () {
                        widget.cardKey.currentState.toggleCard();
                      },
                      child: Text(
                        '立即注册',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(child: Container(child: null)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
