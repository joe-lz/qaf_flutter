import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:qaf_flutter/provider/counter.dart';
import 'package:qaf_flutter/provider/theme/dimens.dart';
import 'package:qaf_flutter/provider/user.dart';
import 'package:qaf_flutter/screens/home/posts/item.dart';
import 'package:qaf_flutter/components/menu_one.dart';
import 'package:qaf_flutter/components/modal_login.dart';

class PostComponent extends StatefulWidget {
  PostComponent({Key key}) : super(key: key);

  @override
  _PostComponentState createState() => _PostComponentState();
}

class _PostComponentState extends State<PostComponent> {
  List items = [
    'https://images.pexels.com/photos/5103656/pexels-photo-5103656.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
    'https://images.pexels.com/photos/927437/pexels-photo-927437.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
    'https://images.pexels.com/photos/5156010/pexels-photo-5156010.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
    'https://images.pexels.com/photos/4392858/pexels-photo-4392858.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
    'https://images.pexels.com/photos/4724068/pexels-photo-4724068.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
    'https://images.pexels.com/photos/4887433/pexels-photo-4887433.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext ctxt, int index) {
          if (index == 0) {
            return Column(
              children: <Widget>[
                SafeArea(
                  top: true,
                  bottom: false,
                  child: Column(
                    children: [
                      Container(height: Dimens.nav_height, child: null),
                    ],
                  ),
                ),
                // MenuOne(
                //   showIconRight: true,
                //   // type: 'active',
                //   // title: 'actions.login'.tr(),
                //   title: '发现你喜欢的圈子',
                //   // colorTitle: Theme.of(context).primaryColor,
                //   action: () {},
                // ),
                PostItemComponent(imageUrl: items[index]),
              ],
            );
          } else {
            return PostItemComponent(imageUrl: items[index]);
          }
        },
      ),
    );
  }
}
