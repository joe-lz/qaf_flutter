import 'dart:math';

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:qaf_flutter/components/menu_one.dart';
import 'package:qaf_flutter/components/navigator.dart';
import 'package:qaf_flutter/provider/theme/colors.dart';
import 'package:qaf_flutter/provider/theme/dimens.dart';
import 'package:qaf_flutter/screens/post_detail/index.dart';
import 'package:qaf_flutter/utils/screen_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<Color> colors = <Color>[];

  Color getRandomColor(int index) {
    if (index >= colors.length) {
      colors.add(Color.fromARGB(255, Random.secure().nextInt(255), Random.secure().nextInt(255), Random.secure().nextInt(255)));
    }
    return colors[index];
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      body: CustomScrollView(
        // physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            stretch: true,
            // onStretchTrigger: () {
            //   print('hello!');
            // },
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: <StretchMode>[
                StretchMode.zoomBackground,
                // StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
              // centerTitle: true,
              // title: const Text('Chris Evans'),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://cdn.pixabay.com/photo/2018/04/29/11/26/road-3359680_1280.jpg',
                    fit: BoxFit.cover,
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, 0.5),
                        end: Alignment(0.0, 0.0),
                        colors: <Color>[
                          Color(0x60000000),
                          Color(0x00000000),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Chris Evans',
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.headline4.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          // CircleAvatar(
                          //   backgroundColor: Colors.pinkAccent,
                          //   child: Icon(
                          //     Icons.play_arrow,
                          //     color: Colors.white,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate((_, index) {
          //     return Container(
          //       child: Text('data'),
          //     );
          //   }, childCount: 1),
          // ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(Dimens.gap_dp16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '在学习 flutter 的时候，总会用到 StatefulWidget，它是一个有状态的 widget，会根据不同状态有不同显示，它的生命周期与 State 有关，它的基本写法如下',
                    // overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Container(height: Dimens.gap_dp16 / 2),
                  new InkWell(
                    child: new Text(
                      '我的微博',
                      style: TextStyle(
                        fontSize: Theme.of(context).textTheme.bodyText1.fontSize,
                        color: Colours().getColor().link_color,
                      ),
                    ),
                    onTap: () => launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html'),
                  ),
                  Container(height: Dimens.gap_dp16 / 2),
                  new InkWell(
                    child: new Text(
                      '其他连接',
                      style: TextStyle(
                        fontSize: Theme.of(context).textTheme.bodyText1.fontSize,
                        color: Colours().getColor().link_color,
                      ),
                    ),
                    onTap: () => launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html'),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            // padding: EdgeInsets.fromLTRB(Dimens.gap_dp16 / 2, 0, Dimens.gap_dp16 / 2, 0),
            padding: EdgeInsets.all(0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                // crossAxisSpacing: Dimens.gap_dp16 / 2,
                // mainAxisSpacing: Dimens.gap_dp16 / 2,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return new Container(
                    height: 150.0,
                    child: Padding(
                      padding: EdgeInsets.all(0),
                      child: GestureDetector(
                        onTap: () {
                          showCupertinoModalBottomSheet(
                            // enableDrag: false,
                            expand: true,
                            duration: Duration(milliseconds: 300),
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context, scrollController) => PostDetailScreen(),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: Image.network(
                            'https://cdn.pixabay.com/photo/2018/04/29/11/26/road-3359680_1280.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
