import 'package:flutter/material.dart';
import 'package:qaf_flutter/components/input_item.dart';
import 'package:qaf_flutter/constants.dart';

class ModalLogin extends StatefulWidget {
  ModalLogin({Key key}) : super(key: key);

  @override
  _ModalLoginState createState() => _ModalLoginState();
}

class _ModalLoginState extends State<ModalLogin> {
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
                borderRadius: BorderRadius.all(Radius.circular(40)),
                child: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width - DefaultPadding * 2,
                  height: 400,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(DefaultPadding * 2, DefaultPadding, DefaultPadding * 2, DefaultPadding),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, DefaultPadding),
                          child: Text(
                            '登录账户',
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: Theme.of(context).textTheme.headline5.fontSize,
                            ),
                          ),
                        ),
                        InputItem(labelText: "用户名", hintText: "用户名或邮箱", prefixIcon: Icon(Icons.person)),
                        InputItem(labelText: "密码", hintText: "您的登录密码", prefixIcon: Icon(Icons.lock), obscureText: true),
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
