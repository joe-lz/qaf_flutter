import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:qaf_flutter/provider/theme/colors.dart';
import 'package:qaf_flutter/provider/theme/dimens.dart';
import 'package:qaf_flutter/provider/user.dart';
import 'package:provider/provider.dart';

import 'package:qaf_flutter/components/input_item.dart';
import 'package:qaf_flutter/utils/screen_utils.dart';
import 'package:flushbar/flushbar.dart';

class CardRegister extends StatefulWidget {
  CardRegister({
    Key key,
    this.cardKey,
    this.leanerr,
  }) : super(key: key);
  final cardKey;
  final leanerr;

  @override
  _CardRegisterState createState() => _CardRegisterState();
}

class _CardRegisterState extends State<CardRegister> {
  String username;
  String password;
  String repassword;
  final _formKey = GlobalKey<FormState>();

  void handleSubmit() async {
    if (_formKey.currentState.validate()) {
      // final snackBar = SnackBar(content: Text('登录中...'));
      // Scaffold.of(context).showSnackBar(snackBar);
      // 登录
      try {
        // 登录成功
        await context.read<UserModal>().handleSignup(username, password);
        Navigator.of(context).pop();
        Flushbar(
          icon: Icon(
            Icons.done_all,
            size: 28.0,
            color: Colors.white,
          ),
          title: "注册成功",
          message: "自动为您登录，快去开始探索吧～",
          duration: Duration(seconds: 3),
          flushbarPosition: FlushbarPosition.TOP,
          margin: EdgeInsets.all(Dimens.gap_dp16),
          borderRadius: Dimens.radius_10,
          backgroundColor: Colours().getColor().success_color,
        )..show(context);
      } on LCException catch (e) {
        print('${e.code} : ${e.message}');
        Flushbar(
          icon: Icon(
            Icons.error,
            size: 28.0,
            color: Colors.white,
          ),
          title: "注册失败",
          message: widget.leanerr['${e.code}'] != null ? widget.leanerr['${e.code}']['msg'] : '未知错误',
          duration: Duration(seconds: 3),
          flushbarPosition: FlushbarPosition.TOP,
          margin: EdgeInsets.all(Dimens.gap_dp16),
          borderRadius: Dimens.radius_10,
          backgroundColor: Colours().getColor().error_color,
        )..show(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(Dimens.radius_40)),
      child: Container(
        color: Theme.of(context).canvasColor,
        width: ScreenUtils.screenW(context) - Dimens.gap_dp16 * 2,
        child: Padding(
          padding: EdgeInsets.fromLTRB(Dimens.gap_dp16 * 2, Dimens.gap_dp16, Dimens.gap_dp16 * 2, Dimens.gap_dp16),
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
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.all(Radius.circular(Dimens.radius_15)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          Icons.close,
                          color: Theme.of(context).accentColor,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                InputItem(
                  // labelText: "用户名",
                  hintText: 'userinfo.keys.username'.tr(),
                  prefixIcon: Icon(Icons.person),
                  validator: (value) {
                    if (value.isEmpty) {
                      return '${'actions.please_enter'.tr()} ${'userinfo.keys.username'.tr()}';
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
                  hintText: 'form.password'.tr(),
                  prefixIcon: Icon(Icons.lock),
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return '${'actions.please_enter'.tr()} ${'form.password'.tr()}';
                    }
                    return null;
                  },
                  onChanged: (text) {
                    setState(() {
                      password = text;
                    });
                  },
                ),
                InputItem(
                  // labelText: "确认密码",
                  hintText: 'form.repassword'.tr(),
                  prefixIcon: Icon(Icons.lock),
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return '请再次输入您的登录密码';
                    } else if (repassword != password) {
                      return '两次输入的密码不相同，请重新输入';
                    }
                    return null;
                  },
                  onChanged: (text) {
                    setState(() {
                      repassword = text;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, Dimens.gap_dp16 / 2, 0, Dimens.gap_dp16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(Dimens.radius_10)),
                    child: Container(
                      width: 300,
                      height: 50,
                      child: Material(
                        color: Theme.of(context).primaryColor,
                        child: InkWell(
                          onTap: () {
                            handleSubmit();
                          },
                          child: Row(
                            children: [
                              Expanded(child: Container(child: null)),
                              Text(
                                'actions.register'.tr(),
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
                  padding: EdgeInsets.fromLTRB(0, 0, 0, Dimens.gap_dp16),
                  child: Row(
                    children: [
                      Expanded(child: Container(child: null)),
                      Text('desc.have_account'.tr()),
                      GestureDetector(
                        onTap: () {
                          widget.cardKey.currentState.toggleCard();
                        },
                        child: Text(
                          'actions.login'.tr(),
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
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
