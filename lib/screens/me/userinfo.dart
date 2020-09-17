import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qaf_flutter/components/menu_group.dart';
import 'package:qaf_flutter/components/menu_item/index.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:qaf_flutter/provider/theme_provider/colors.dart';
import 'package:qaf_flutter/provider/theme_provider/dimens.dart';

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
  bool editMode = false;

  String gender;
  int age;
  int weight;
  int height;
  String blood;
  String constellation; // 星座

  void handleSubmit() {
    setState(() {
      editMode = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var date = new DateTime.now().toString();
    var dateParse = DateTime.parse(date);
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  border: Border(
                    bottom: BorderSide(width: 0.5, color: Theme.of(context).dividerTheme.color),
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
                            fontSize: Theme.of(context).textTheme.bodyText1.fontSize,
                            color: editMode ? Theme.of(context).textTheme.caption.color : Theme.of(context).primaryColor,
                          ),
                        ),
                        onPressed: editMode
                            ? null
                            : () {
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
                          editMode ? "保存" : '编辑',
                          style: TextStyle(
                            fontSize: Theme.of(context).textTheme.bodyText1.fontSize,
                            fontWeight: editMode ? FontWeight.w500 : FontWeight.w400,
                            // color: Theme.of(context).primaryColor,
                          ),
                        ),
                        onPressed: () {
                          if (editMode) {
                            handleSubmit();
                          } else {
                            setState(() {
                              editMode = true;
                            });
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, Dimens.gap_dp16, 0, 0),
                        child: Icon(
                          Icons.account_circle,
                          size: 80,
                          color: Theme.of(context).textTheme.caption.color,
                        ),
                      ),
                      MenuGroup(
                        title: '基本信息',
                        desc: '您的资料将不会与任何第三方共享，请放心填写。',
                        children: [
                          MenuItem(
                            showBorderBottom: true,
                            title: '用户名',
                            desc: widget.userinfo.username,
                          ),
                          MenuItem(
                            editMode: editMode,
                            showBorderBottom: true,
                            title: '性别',
                            desc: gender,
                            descHint: '-',
                            inputType: 'actionsheet',
                            dataActionSheet: ['男', '女'],
                            onChanged: (value) {
                              setState(() {
                                gender = value;
                              });
                            },
                          ),
                          MenuItem(
                            editMode: editMode,
                            showBorderBottom: true,
                            title: '年龄',
                            unit: '年',
                            desc: age,
                            descHint: '-',
                            inputType: 'picker',
                            dataPicker: [NumberPickerColumn(begin: dateParse.year - 80, end: dateParse.year)],
                            onChanged: (value) {
                              setState(() {
                                age = value;
                              });
                            },
                          ),
                          MenuItem(
                            editMode: editMode,
                            showBorderBottom: true,
                            title: '身高',
                            unit: 'cm',
                            desc: height,
                            descHint: '-',
                            inputType: 'picker',
                            dataPicker: [NumberPickerColumn(begin: 120, end: 220)],
                            onChanged: (value) {
                              setState(() {
                                height = value;
                              });
                            },
                          ),
                          MenuItem(
                            editMode: editMode,
                            showBorderBottom: false,
                            title: '体重',
                            unit: 'kg',
                            desc: weight,
                            descHint: '-',
                            inputType: 'picker',
                            dataPicker: [NumberPickerColumn(begin: 40, end: 220)],
                            onChanged: (value) {
                              setState(() {
                                weight = value;
                              });
                            },
                          ),
                        ],
                      ),
                      MenuGroup(
                        title: '个人资料',
                        children: [
                          MenuItem(
                            editMode: editMode,
                            showBorderBottom: true,
                            title: '血型',
                            desc: blood,
                            descHint: '-',
                            inputType: 'actionsheet',
                            dataActionSheet: ['A型', 'B型', 'AB型', 'O型', 'P型', 'RH阴性型', 'MNSSU型'],
                            onChanged: (value) {
                              setState(() {
                                blood = value;
                              });
                            },
                          ),
                          // MenuItem(
                          //   editMode: editMode,
                          //   showBorderBottom: true,
                          //   title: '星座',
                          //   desc: constellation,
                          //   descHint: '-',
                          //   inputType: 'picker',
                          //   pickerType: 'simple',
                          //   pickerList: [
                          //     '水瓶座：1月21日 - 2月19日',
                          //     '双鱼座：2月20日 - 3月20日',
                          //     '白羊座：3月21日 - 4月20日',
                          //     '金牛座：4月21日 - 5月21日',
                          //     '双子座：5月22日 - 6月21日',
                          //     '巨蟹座：6月22日 - 7月22日',
                          //     '狮子座：7月23日 - 8月23日',
                          //     '处女座：8月24日 - 9月23日',
                          //     '天秤座：9月24日 - 10月23日',
                          //     '天蝎座：10月24日 - 11月22日',
                          //     '射手座：11月23日 - 12月21日',
                          //     '摩羯座：12月22日 - 1月20日',
                          //   ],
                          //   onChanged: (value) {
                          //     setState(() {
                          //       constellation = value;
                          //     });
                          //   },
                          // ),
                          MenuItem(
                            editMode: editMode,
                            showBorderBottom: true,
                            title: '城市',
                            desc: null,
                            descHint: '-',
                          ),
                          MenuItem(
                            editMode: editMode,
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
                            editMode: editMode,
                            showBorderBottom: true,
                            title: '角色',
                            desc: null,
                            descHint: '-',
                          ),
                          MenuItem(
                            editMode: editMode,
                            showBorderBottom: true,
                            title: '情感状态',
                            desc: null,
                            descHint: '-',
                          ),
                          MenuItem(
                            editMode: editMode,
                            showBorderBottom: true,
                            title: '交友目的',
                            desc: null,
                            descHint: '-',
                          ),
                          MenuItem(
                            editMode: editMode,
                            showBorderBottom: true,
                            title: '体形',
                            desc: null,
                            descHint: '-',
                          ),
                          MenuItem(
                            editMode: editMode,
                            showBorderBottom: false,
                            title: '个人签名',
                            desc: null,
                            descHint: '-',
                          ),
                        ],
                      ),
                      // MenuOne(
                      //   title: '个人签名',
                      //   desc: null,
                      //   descHint: '-',
                      //   // showIconRight: true,
                      //   // type: 'disabled',
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
