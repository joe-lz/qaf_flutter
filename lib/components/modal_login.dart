import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qaf_flutter/components/input_item.dart';
import 'package:qaf_flutter/constants.dart';

class ModalLogin extends StatefulWidget {
  ModalLogin({Key key}) : super(key: key);

  @override
  _ModalLoginState createState() => _ModalLoginState();
}

class _ModalLoginState extends State<ModalLogin> {
  String username;
  String password;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: Column(
            children: [
              // TitlePage(title: '登录'),
              Expanded(
                child: Container(
                  child: null,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(RadiusLarge)),
                child: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width - DefaultPadding * 2,
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
                                    print('$username, $password');
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
                                  // print('$username, $password');
                                  print('object');
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
              Container(
                height: DefaultPadding,
                child: null,
              )
            ],
          ),
        ),
      ),
    );
  }
}
