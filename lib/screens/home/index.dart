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

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = SwiperController();
  int _currentIndex = 1;

  List<Color> colors = [
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];
  @override
  void initState() {
    super.initState();
    context.read<UserModal>().getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        top: true,
        bottom: false,
        child: Column(
          children: [
            // Container(
            //   alignment: Alignment.center,
            //   child: ,
            // ),
            Padding(
              padding: EdgeInsets.only(bottom: Dimens.gap_dp16 / 2),
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
                          // setState(() {
                          //   _currentIndex = value;
                          // });
                          _controller.move(value, animation: true);
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
            Expanded(
              flex: 1,
              child: Swiper(
                physics:
                    (context.watch<GlobalModal>().disableHomeSwipe && _currentIndex == 2) ? NeverScrollableScrollPhysics() : AlwaysScrollableScrollPhysics(),
                index: _currentIndex,
                itemCount: 3,
                loop: false,
                duration: 10,
                controller: _controller,
                onIndexChanged: (int index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                // pagination: SwiperPagination(),
                // control: SwiperControl(),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    // color: colors[index],
                    child: index == 0 ? NearbyComponent() : (index == 1 ? PostComponent() : CardComponent()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
