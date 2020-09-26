import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:lottie/lottie.dart';

import 'package:qaf_flutter/provider/theme/dimens.dart';
import 'package:qaf_flutter/utils/screen_utils.dart';
import 'package:qaf_flutter/iconfont/IconFont.dart';

class PostItemComponent extends StatefulWidget {
  PostItemComponent({
    Key key,
    this.imageUrl,
  }) : super(key: key);
  String imageUrl;

  @override
  _PostItemComponentState createState() => _PostItemComponentState();
}

class _PostItemComponentState extends State<PostItemComponent> with TickerProviderStateMixin {
  AnimationController _animationController;
  bool _showAnimation = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            _showAnimation = false;
          });
        }
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: EdgeInsets.all(Dimens.gap_dp16),
      // padding: EdgeInsets.only(top: Dimens.gap_dp16),
      padding: EdgeInsets.fromLTRB(Dimens.gap_dp16, Dimens.gap_dp16 / 6, Dimens.gap_dp16, Dimens.gap_dp16 / 2),
      child: Container(
        width: ScreenUtils.screenW(context) - Dimens.gap_dp16 / 2,
        // width: ScreenUtils.screenW(context),
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.all(Radius.circular(Dimens.radius_15)),
          // borderRadius: BorderRadius.only(
          //   topRight: Radius.circular(40),
          //   topLeft: Radius.circular(40),
          // ),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.1),
          //     spreadRadius: 1,
          //     blurRadius: 1,
          //     offset: Offset(0, 0),
          //   ),
          // ],
          // border: Border(
          //   bottom: BorderSide(width: 0.5, color: Theme.of(context).dividerTheme.color),
          // ),
        ),
        child: Padding(
          padding: EdgeInsets.all(Dimens.gap_dp16 / 2),
          child: Column(
            children: [
              Container(
                height: 35,
                child: Row(
                  children: [
                    ClipOval(
                      child: Container(
                        width: 32,
                        height: 32,
                        color: Theme.of(context).scaffoldBackgroundColor,
                        child: Image.network(
                          widget.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(left: Dimens.font_sp16 / 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dominic Brown',
                              style: TextStyle(
                                fontSize: Theme.of(context).textTheme.bodyText1.fontSize,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '4分钟之前',
                              style: TextStyle(
                                fontSize: Theme.of(context).textTheme.caption.fontSize,
                                color: Theme.of(context).textTheme.caption.color,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Icon(
                      Icons.more_horiz,
                      size: 24,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: Dimens.gap_dp16 / 2),
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onDoubleTap: () {
                              setState(() {
                                _showAnimation = true;
                              });
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(Dimens.radius_10)),
                              child: Container(
                                height: 300,
                                color: Theme.of(context).scaffoldBackgroundColor,
                                child: Image.network(
                                  widget.imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: _showAnimation,
                      child: Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: ScreenUtils.screenW(context) - Dimens.gap_dp16 * 2 - Dimens.gap_dp16,
                          height: 300,
                          child: Center(
                            child: Lottie.asset(
                              'assets/lottie/like.json',
                              width: 100,
                              height: 100,
                              fit: BoxFit.fill,
                              animate: true,
                              repeat: false,
                              controller: _animationController,
                              onLoaded: (composition) {
                                _animationController
                                  ..duration = composition.duration
                                  ..reset()
                                  ..forward();
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  Dimens.gap_dp16 / 2,
                  Dimens.gap_dp16,
                  Dimens.gap_dp16 / 2,
                  Dimens.gap_dp16,
                ),
                child: Row(
                  children: [
                    // Icon(Icons.share, size: 24),
                    IconFont(IconNames.heart, size: 24),
                    SizedBox(width: 20),
                    IconFont(IconNames.xiaoxi, size: 18),
                    SizedBox(width: 20),
                    IconFont(IconNames.send_s, size: 24),
                    Spacer(),
                    IconFont(IconNames.shoucang, size: 18),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
