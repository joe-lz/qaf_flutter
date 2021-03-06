import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:qaf_flutter/provider/theme/dimens.dart';
import 'package:provider/provider.dart';
import 'package:qaf_flutter/provider/user.dart';
import 'package:qaf_flutter/provider/user_profile.dart';

import 'package:qaf_flutter/components/menu_group.dart';
import 'package:qaf_flutter/components/menu_item/index.dart';

class UserInfo extends StatefulWidget {
  UserInfo({Key key}) : super(key: key);

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  bool editMode = false;

  String username;
  String gender;
  int age;
  int weight;
  int height;
  String blood;
  String constellation; // 星座
  String province; // 省
  String city; // 城市
  String job;
  String position;
  String statement;
  String purpose;
  String bodyshape;
  String position_like;
  String bodyshape_like;

  @override
  void initState() {
    super.initState();
    // setUserProfile();
  }

  void setUserProfile() async {
    await context.read<UserProfileModal>().getMyUserProfile();
    LCUser _currentUser = context.read<UserModal>().currentUser;
    setState(() {
      username = _currentUser.username;
      // gender = _currentUser.gender;
      // age = _currentUser.age;
      // weight = _currentUser.weight;
      // height = _currentUser.height;
      // blood = _currentUser.blood;
      // constellation = _currentUser.constellation;
      // province = _currentUser.province;
      // city = _currentUser.city;
      // job = _currentUser.job;
      // position = _currentUser.position;
      // statement = _currentUser.statement;
      // purpose = _currentUser.purpose;
      // bodyshape = _currentUser.bodyshape;
      // position_like = _currentUser.position_like;
      // bodyshape_like = _currentUser.bodyshape_like;
    });
  }

  void handleSubmit() {
    setState(() {
      editMode = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var date = new DateTime.now().toString();
    var dateParse = DateTime.parse(date);
    LCUser _currentUser = context.watch<UserModal>().currentUser;

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
                          'actions.cancel'.tr(),
                          style: TextStyle(
                            fontSize: Theme.of(context).textTheme.subtitle1.fontSize,
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
                          editMode ? 'actions.save'.tr() : 'actions.edit'.tr(),
                          style: TextStyle(
                            fontSize: Theme.of(context).textTheme.subtitle1.fontSize,
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
                        title: 'userinfo.title.basic'.tr(),
                        desc: '您的资料将不会与任何第三方共享，请放心填写。',
                        children: [
                          MenuItem(
                            showBorderBottom: true,
                            title: 'userinfo.keys.username'.tr(),
                            desc: username,
                          ),
                          MenuItem(
                            editMode: editMode,
                            showBorderBottom: true,
                            title: 'userinfo.keys.gender'.tr(),
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
                            title: 'userinfo.keys.age'.tr(),
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
                            title: 'userinfo.keys.height'.tr(),
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
                            title: 'userinfo.keys.weight'.tr(),
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
                        title: 'userinfo.title.detail'.tr(),
                        children: [
                          MenuItem(
                            editMode: editMode,
                            showBorderBottom: true,
                            title: 'userinfo.keys.blood'.tr(),
                            desc: blood,
                            descHint: '-',
                            // inputType: 'actionsheet',
                            // dataActionSheet: ['A型', 'B型', 'AB型', 'O型', 'P型', 'RH阴性型', 'MNSSU型'],
                            inputType: 'picker',
                            pickerType: 'simple',
                            unit: '型',
                            dataPickerSimple: ['A', 'B', 'AB', 'O', 'P', 'RH阴性', 'MNSSU'],
                            onChanged: (value) {
                              setState(() {
                                blood = value;
                              });
                            },
                          ),
                          MenuItem(
                            editMode: editMode,
                            showBorderBottom: true,
                            title: 'userinfo.keys.constellation'.tr(),
                            desc: constellation,
                            descHint: '-',
                            inputType: 'picker',
                            pickerType: 'simple',
                            dataPickerSimple: ['水瓶座', '双鱼座', '白羊座', '金牛座', '双子座', '巨蟹座', '狮子座', '处女座', '天秤座', '天蝎座', '射手座', '摩羯座'],
                            onChanged: (value) {
                              setState(() {
                                constellation = value;
                              });
                            },
                          ),
                          MenuItem(
                            editMode: editMode,
                            showBorderBottom: true,
                            title: 'userinfo.keys.city'.tr(),
                            desc: (province != null && city != null) ? city : null,
                            descHint: '-',
                            inputType: 'picker',
                            pickerType: 'city',
                            onChanged: (value) {
                              print(value);
                              setState(() {
                                province = value[0];
                                city = value[1];
                              });
                            },
                          ),
                          MenuItem(
                            editMode: editMode,
                            showBorderBottom: false,
                            title: 'userinfo.keys.job'.tr(),
                            desc: job,
                            descHint: '-',
                            inputType: 'picker',
                            pickerType: 'simple',
                            dataPickerSimple: [
                              '学生',
                              '互联网/IT/通信',
                              '金融',
                              '房地产/建筑/工程',
                              '教育/培训/咨询/科研',
                              '影视/娱乐/文化',
                              '旅游/酒店/餐饮',
                              '媒体/广告',
                              '医疗/卫生/社会服务',
                              '政府/组织',
                              '美容/美发/养生',
                              '贸易/零售',
                              '工业/矿产/能源/环保',
                              '农/林/牧副/渔'
                            ],
                            onChanged: (value) {
                              setState(() {
                                job = value;
                              });
                            },
                          ),
                        ],
                      ),
                      MenuGroup(
                        title: 'userinfo.title.dating'.tr(),
                        children: [
                          MenuItem(
                            editMode: editMode,
                            showBorderBottom: true,
                            title: 'userinfo.keys.position'.tr(),
                            desc: position,
                            descHint: '-',
                            inputType: 'actionsheet',
                            dataActionSheet: gender == '女' ? ['T', 'P', 'H'] : ['0', '0.5', '1'],
                            onChanged: (value) {
                              setState(() {
                                position = value;
                              });
                            },
                          ),
                          MenuItem(
                            editMode: editMode,
                            showBorderBottom: true,
                            title: 'userinfo.keys.statement'.tr(),
                            desc: statement,
                            descHint: '-',
                            inputType: 'picker',
                            pickerType: 'simple',
                            dataPickerSimple: ['恋爱中', '开放关系', '单身'],
                            onChanged: (value) {
                              setState(() {
                                statement = value;
                              });
                            },
                          ),
                          MenuItem(
                            editMode: editMode,
                            showBorderBottom: true,
                            title: 'userinfo.keys.purpose'.tr(),
                            desc: purpose,
                            descHint: '-',
                            inputType: 'picker',
                            pickerType: 'simple',
                            dataPickerSimple: ['聊天', '朋友', '约会', '情侣', '一起健身'],
                            onChanged: (value) {
                              setState(() {
                                purpose = value;
                              });
                            },
                          ),
                          MenuItem(
                            editMode: editMode,
                            showBorderBottom: true,
                            title: 'userinfo.keys.bodyshape'.tr(),
                            desc: bodyshape,
                            descHint: '-',
                            inputType: 'picker',
                            pickerType: 'simple',
                            dataPickerSimple: ['精瘦', '匀称', '肌肉', '壮硕', '肉胖'],
                            onChanged: (value) {
                              setState(() {
                                bodyshape = value;
                              });
                            },
                          ),
                          MenuItem(
                            editMode: editMode,
                            showBorderBottom: false,
                            title: 'userinfo.keys.about'.tr(),
                            desc: null,
                            descHint: '-',
                          ),
                        ],
                      ),
                      MenuGroup(
                        title: 'userinfo.title.like'.tr(),
                        children: [
                          MenuItem(
                            editMode: editMode,
                            showBorderBottom: true,
                            title: 'userinfo.keys.position_like'.tr(),
                            desc: position_like,
                            descHint: '-',
                            inputType: 'actionsheet',
                            dataActionSheet: gender == '女' ? ['T', 'P', 'H'] : ['0', '0.5', '1'],
                            onChanged: (value) {
                              setState(() {
                                position_like = value;
                              });
                            },
                          ),
                          MenuItem(
                            editMode: editMode,
                            showBorderBottom: true,
                            title: 'userinfo.keys.bodyshape_like'.tr(),
                            desc: bodyshape_like,
                            descHint: '-',
                            inputType: 'picker',
                            pickerType: 'simple',
                            dataPickerSimple: ['精瘦', '匀称', '肌肉', '壮硕', '肉胖'],
                            onChanged: (value) {
                              setState(() {
                                bodyshape_like = value;
                              });
                            },
                          ),
                        ],
                      ),
                      Container(
                        height: 50,
                        child: null,
                      )
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
