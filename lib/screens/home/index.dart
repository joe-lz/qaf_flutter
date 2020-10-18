import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:qaf_flutter/iconfont/IconFont.dart';
import 'package:image_picker/image_picker.dart';

import 'package:qaf_flutter/provider/counter.dart';
import 'package:qaf_flutter/provider/global.dart';
import 'package:qaf_flutter/provider/theme/dimens.dart';
import 'package:qaf_flutter/provider/user.dart';
import 'package:qaf_flutter/screens/home/card/index.dart';
import 'package:qaf_flutter/screens/home/nearby/index.dart';
import 'package:qaf_flutter/screens/home/posts/index.dart';
import 'package:qaf_flutter/screens/message/index.dart';
import 'package:qaf_flutter/screens/post_edit/index.dart';
import 'package:qaf_flutter/utils/screen_utils.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final _controller = SwiperController();
  int _currentIndex = 1;
  // List<Color> colors = [
  //   Colors.blue,
  //   Colors.yellow,
  //   Colors.red,
  // ];
  final Map<int, Widget> pages = <int, Widget>{
    0: NearbyComponent(),
    1: PostComponent(),
    2: CardComponent(),
  };

  @override
  void initState() {
    super.initState();
    context.read<UserModal>().getCurrentUser();
  }

  void onLeftIconClick() {
    if (_currentIndex == 0 || _currentIndex == 1 || _currentIndex == 2) {
      showCupertinoModalBottomSheet(
        // enableDrag: false,
        expand: true,
        duration: Duration(milliseconds: 300),
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context, scrollController) => MessageScreen(),
      );
    }
  }

  void onRightIconClick() {
    if (_currentIndex == 0 || _currentIndex == 2) {
      // showCupertinoModalBottomSheet(
      //   // enableDrag: false,
      //   expand: true,
      //   duration: Duration(milliseconds: 300),
      //   backgroundColor: Colors.transparent,
      //   context: context,
      //   builder: (context, scrollController) => MessageScreen(),
      // );
    } else if (_currentIndex == 1) {
      showMaterialModalBottomSheet(
        enableDrag: false,
        context: context,
        builder: (context, scrollController) => PostEditScreen(),
      );
      // showCupertinoModalPopup(
      //   context: context,
      //   builder: (context) {
      //     return CupertinoActionSheet(
      //       // title: Text('提示'),
      //       message: Text('请选择照片来源'),
      //       actions: <Widget>[
      //         CupertinoActionSheetAction(
      //           isDefaultAction: false,
      //           child: Text('拍摄'),
      //           onPressed: () {
      //             Navigator.pop(context, 'Cancel');
      //           },
      //         ),
      //         CupertinoActionSheetAction(
      //           isDefaultAction: false,
      //           child: Text('从手机相册选择'),
      //           onPressed: () async {
      //             Navigator.pop(context, 'Cancel');
      //             showMaterialModalBottomSheet(
      //               // backgroundColor: Colors.transparent,
      //               // isDismissible: false,
      //               enableDrag: false,
      //               context: context,
      //               builder: (context, scrollController) => PostEditScreen(),
      //             );
      //           },
      //           // isDestructiveAction: true,
      //         ),
      //       ],
      //       cancelButton: CupertinoActionSheetAction(
      //         child: Text('actions.cancel'.tr()),
      //         isDestructiveAction: true,
      //         // isDefaultAction: true,
      //         onPressed: () {
      //           Navigator.pop(context, 'Cancel');
      //         },
      //       ),
      //     );
      //   },
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    context.watch<GlobalModal>().setStatusBar();
    final Map<int, Widget> leftIcon = <int, Widget>{
      0: IconFont(
        IconNames.xiaoxi_cuxiantiao,
        size: 22,
        color: '#${Theme.of(context).textTheme.bodyText1.color.value.toRadixString(16)}',
      ),
      1: IconFont(
        IconNames.xiaoxi_cuxiantiao,
        size: 22,
        color: '#${Theme.of(context).textTheme.bodyText1.color.value.toRadixString(16)}',
      ),
      2: IconFont(
        IconNames.xiaoxi_cuxiantiao,
        size: 22,
        color: '#${Theme.of(context).textTheme.bodyText1.color.value.toRadixString(16)}',
      ),
    };
    final Map<int, Widget> rightIcon = <int, Widget>{
      0: Icon(
        Icons.tune,
        color: Theme.of(context).textTheme.bodyText1.color,
      ),
      1: IconFont(
        IconNames.shumaxiangji,
        size: 22,
        color: '#${Theme.of(context).textTheme.bodyText1.color.value.toRadixString(16)}',
      ),
      2: null,
    };
    return Container(
      color: Theme.of(context).canvasColor,
      child: Stack(
        children: [
          // FractionallySizedBox(
          //   heightFactor: 1,
          //   child: Container(
          //     width: ScreenUtils.screenW(context),
          //     child: MapComponent(),
          //   ),
          // ),
          ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: pages[_currentIndex],
          ),
          Positioned(
            left: 0.0,
            top: 0.0,
            child: Container(
              color: _currentIndex != 0 ? Theme.of(context).canvasColor : Colors.transparent,
              width: ScreenUtils.screenW(context),
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    Dimens.gap_dp16,
                    0,
                    Dimens.gap_dp16,
                    0,
                  ),
                  child: Container(
                    height: Dimens.nav_height,
                    child: Row(
                      children: [
                        Container(
                          width: 22,
                          child: GestureDetector(
                            child: FractionallySizedBox(
                              heightFactor: 1,
                              child: Container(child: leftIcon[_currentIndex]),
                            ),
                            onTap: () {
                              onLeftIconClick();
                            },
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: CupertinoSlidingSegmentedControl(
                              children: {
                                0: Container(width: 60, child: Center(child: Text('me_menus.nearby'.tr()))
                                    // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                    ),
                                1: Container(width: 60, child: Center(child: Text('me_menus.posts'.tr()))
                                    // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                    ),
                                2: Container(width: 60, child: Center(child: Text('me_menus.matches'.tr()))
                                    // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                    ),
                              },
                              groupValue: _currentIndex,
                              onValueChanged: (value) {
                                setState(() {
                                  _currentIndex = value;
                                });
                                // _controller.move(value, animation: true);
                              },
                            ),
                          ),
                        ),
                        Container(
                          width: 22,
                          child: GestureDetector(
                            child: FractionallySizedBox(
                              heightFactor: 1,
                              child: Container(child: rightIcon[_currentIndex]),
                            ),
                            onTap: () {
                              onRightIconClick();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          // new Center(
          //   child: new ClipRect(
          //     child: new BackdropFilter(
          //       filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          //       child: new Container(
          //         width: 300.0,
          //         height: 300.0,
          //         decoration: new BoxDecoration(
          //           color: Colors.grey.shade200.withOpacity(0.6),
          //         ),
          //         child: new Center(
          //           child: new Text('Frosted'),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
