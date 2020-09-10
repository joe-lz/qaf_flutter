import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qaf_flutter/components/input_item.dart';
import 'package:qaf_flutter/constants.dart';
import 'package:qaf_flutter/utils/screen_utils.dart';

class CardRegister extends StatefulWidget {
  CardRegister({
    Key key,
    this.cardKey,
  }) : super(key: key);
  final cardKey;

  @override
  _CardRegisterState createState() => _CardRegisterState();
}

class _CardRegisterState extends State<CardRegister> {
  String username;
  String password;
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
              // Padding(
              //   padding: EdgeInsets.fromLTRB(0, 0, 0, DefaultPadding),
              //   child: Text(
              //     '登录账户',
              //     style: TextStyle(
              //       color: kPrimaryColor,
              //       fontSize: Theme.of(context).textTheme.headline5.fontSize,
              //       fontWeight: FontWeight.w500,
              //     ),
              //   ),
              // ),
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
              InputItem(
                labelText: "确认密码",
                hintText: "再次输入您的登录密码",
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
                          print('$username, $password');
                        },
                        child: Row(
                          children: [
                            Expanded(child: Container(child: null)),
                            Text(
                              '注册',
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
                    Text('已有帐户？'),
                    GestureDetector(
                      onTap: () {
                        widget.cardKey.currentState.toggleCard();
                      },
                      child: Text(
                        '立即登录',
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
