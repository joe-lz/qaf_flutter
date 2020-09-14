import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:qaf_flutter/components/input_item.dart';
import 'package:qaf_flutter/constants.dart';
import 'package:qaf_flutter/provider/global.dart';
import 'package:qaf_flutter/utils/screen_utils.dart';
import 'package:flushbar/flushbar.dart';

class CardLogin extends StatefulWidget {
  CardLogin({
    Key key,
    this.cardKey,
    this.leanerr,
  }) : super(key: key);
  final cardKey;
  final leanerr;

  @override
  _CardLoginState createState() => _CardLoginState();
}

class _CardLoginState extends State<CardLogin> {
  String username;
  String password;
  final _formKey = GlobalKey<FormState>();

  void handleSubmit() async {
    if (_formKey.currentState.validate()) {
      // final snackBar = SnackBar(content: Text('登录中...'));
      // Scaffold.of(context).showSnackBar(snackBar);
      // 登录
      try {
        // 登录成功
        LCUser user = await LCUser.login(username, password);
        Navigator.of(context).pop();
        Flushbar(
          icon: Icon(
            Icons.done_all,
            size: 28.0,
            color: Colors.white,
          ),
          title: "登录成功",
          message: "更多功能等待您探索哦～",
          duration: Duration(seconds: 3),
          flushbarPosition: FlushbarPosition.TOP,
          margin: EdgeInsets.all(DefaultPadding),
          borderRadius: RadiusNormal,
          backgroundColor: kColorSuccess,
        )..show(context);
      } on LCException catch (e) {
        print('${e.code} : ${e.message}');
        Flushbar(
          icon: Icon(
            Icons.error,
            size: 28.0,
            color: Colors.white,
          ),
          title: "登录失败",
          message: widget.leanerr['${e.code}'] != null ? widget.leanerr['${e.code}']['msg'] : '未知错误',
          duration: Duration(seconds: 3),
          flushbarPosition: FlushbarPosition.TOP,
          margin: EdgeInsets.all(DefaultPadding),
          borderRadius: RadiusNormal,
          backgroundColor: kColorError,
        )..show(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(RadiusLarge)),
      child: Container(
        color: GlobalModel().getTheme().kBlockColor,
        width: ScreenUtils.screenW(context) - DefaultPadding * 2,
        // height: 400,
        child: Padding(
          padding: EdgeInsets.fromLTRB(DefaultPadding * 2, DefaultPadding, DefaultPadding * 2, DefaultPadding),
          child: Form(
            key: _formKey,
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
                  // labelText: "用户名",
                  hintText: "用户名",
                  prefixIcon: Icon(Icons.person),
                  validator: (value) {
                    if (value.isEmpty) {
                      return '请输入用户名';
                    }
                    return null;
                  },
                  onChanged: (text) {
                    setState(() {
                      username = text;
                    });
                  },
                ),
                InputItem(
                  // labelText: "密码",
                  hintText: "您的登录密码",
                  prefixIcon: Icon(Icons.lock),
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return '请输入您的登录密码';
                    }
                    return null;
                  },
                  onChanged: (text) {
                    setState(() {
                      password = text;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, DefaultPadding / 2, 0, DefaultPadding),
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
                            handleSubmit();
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
      ),
    );
  }
}
