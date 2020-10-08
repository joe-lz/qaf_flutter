import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import 'package:qaf_flutter/components/menu_group.dart';
import 'package:qaf_flutter/components/menu_item/index.dart';
import 'package:qaf_flutter/components/page_title.dart';
import 'package:qaf_flutter/provider/user.dart';
import 'package:qaf_flutter/screens/discover/block.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserModal>().getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: SingleChildScrollView(
        child: Column(
          children: [
            PageTitle(
              title: 'tabbar.discover'.tr(),
              right: null,
            ),
            DiscoverBlockComponent(
              title: '健康',
              child: MenuGroup(
                children: [
                  MenuItem(
                    showBorderBottom: true,
                    showIconRight: true,
                    title: '健康防护',
                    descHint: '免费hiv检测',
                    action: () {
                      print('我是action');
                    },
                  ),
                ],
              ),
            ),
            DiscoverBlockComponent(
              title: '休闲',
              child: MenuGroup(
                children: [
                  MenuItem(
                    showBorderBottom: true,
                    showIconRight: true,
                    title: '热门活动',
                    descHint: '唱歌、桌游、密室',
                    action: () {},
                  ),
                  MenuItem(
                    showBorderBottom: true,
                    showIconRight: true,
                    title: '查找圈子',
                    // descHint: '',
                    action: () {},
                  ),
                  MenuItem(
                    showBorderBottom: true,
                    showIconRight: true,
                    title: '一起去旅行 ✈',
                    action: () {},
                  ),
                  // MenuItem(
                  //   showBorderBottom: true,
                  //   showIconRight: true,
                  //   title: '树洞 🕳️',
                  //   descHint: '吐槽、八卦',
                  //   action: () {},
                  // ),
                ],
              ),
            ),
            DiscoverBlockComponent(
              title: '休闲',
              child: MenuGroup(
                children: [
                  MenuItem(
                    showBorderBottom: true,
                    showIconRight: true,
                    title: '资讯',
                    action: () {
                      print('我是action');
                    },
                  ),
                  MenuItem(
                    showBorderBottom: true,
                    showIconRight: true,
                    title: '影视',
                    descHint: '电视剧/电影/短片',
                    action: () {
                      print('我是action');
                    },
                  ),
                ],
              ),
            ),
            DiscoverBlockComponent(
              title: '健康',
              child: MenuGroup(
                children: [
                  MenuItem(
                    showBorderBottom: true,
                    showIconRight: true,
                    title: '商城',
                    descHint: '🌈周边',
                    action: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
