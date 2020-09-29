import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:qaf_flutter/provider/counter.dart';
import 'package:qaf_flutter/provider/global.dart';
import 'package:qaf_flutter/provider/theme/dimens.dart';
import 'package:qaf_flutter/provider/user.dart';
import 'package:qaf_flutter/screens/home/card/index.dart';
import 'package:qaf_flutter/screens/home/nearby/index.dart';
import 'package:qaf_flutter/screens/home/posts/index.dart';
import 'package:qaf_flutter/utils/screen_utils.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final _controller = SwiperController();
  int _currentIndex = 1;

  List<Color> colors = [
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];
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

  @override
  Widget build(BuildContext context) {
    context.watch<GlobalModal>().setStatusBar();
    return Container(
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
              // color: Color.fromRGBO(255, 255, 255, 0.9),
              color: _currentIndex != 0 ? Theme.of(context).scaffoldBackgroundColor : Colors.transparent,
              width: ScreenUtils.screenW(context),
              child: SafeArea(
                top: true,
                bottom: false,
                child: Container(
                  height: Dimens.nav_height,
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        child: _currentIndex == 0 ? Icon(Icons.search) : null,
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: CupertinoSlidingSegmentedControl(
                            children: {
                              0: Container(
                                child: Text('me_menus.nearby'.tr()),
                                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                              ),
                              1: Container(
                                child: Text('me_menus.posts'.tr()),
                                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                              ),
                              2: Container(
                                child: Text('me_menus.matches'.tr()),
                                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                        width: 50,
                        child: _currentIndex == 0 ? Icon(Icons.tune) : null,
                      ),
                    ],
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
