import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:lottie/lottie.dart';
import 'package:screenshot/screenshot.dart';
import 'package:gallery_saver/gallery_saver.dart';

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

  ScreenshotController _screenshotController = ScreenshotController();
  File _imageFile;

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

  void handleScreenShot() {
    _screenshotController.capture(pixelRatio: 2).then((File image) {
      //Capture Done
      print(image);
      setState(() {
        _imageFile = image;
      });
    }).catchError((onError) {
      print(onError);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: _screenshotController,
      child: Padding(
        // padding: EdgeInsets.all(0),
        padding: EdgeInsets.only(top: Dimens.gap_dp16),
        // padding: EdgeInsets.fromLTRB(Dimens.gap_dp16, Dimens.gap_dp16 / 6, Dimens.gap_dp16, Dimens.gap_dp16 / 2),
        child: Container(
          // width: ScreenUtils.screenW(context) - Dimens.gap_dp16 / 2,
          width: ScreenUtils.screenW(context),
          decoration: BoxDecoration(
              // color: Theme.of(context).canvasColor,
              // borderRadius: BorderRadius.all(Radius.circular(Dimens.radius_15)),
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
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  Dimens.gap_dp16,
                  0,
                  Dimens.gap_dp16,
                  0,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/home_detail");
                      },
                      child: ClipOval(
                        child: Container(
                          width: 30,
                          height: 30,
                          color: Theme.of(context).scaffoldBackgroundColor,
                          child: Image.network(
                            widget.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/home_detail");
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: Dimens.font_sp16 / 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Dominic Brown',
                                style: TextStyle(
                                  fontSize: Theme.of(context).textTheme.bodyText1.fontSize,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              // Text(
                              //   '4分钟之前',
                              //   style: TextStyle(
                              //     fontSize: Theme.of(context).textTheme.caption.fontSize,
                              //     color: Theme.of(context).textTheme.caption.color,
                              //     fontWeight: FontWeight.w500,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.more_horiz,
                      size: 22,
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
                            // onTap: () {
                            //   Navigator.pushNamed(context, "/home_detail");
                            // },
                            child: ClipRRect(
                              // borderRadius: BorderRadius.all(Radius.circular(Dimens.radius_10)),
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
                          // width: ScreenUtils.screenW(context) - Dimens.gap_dp16 * 2 - Dimens.gap_dp16,
                          width: ScreenUtils.screenW(context),
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
                    Expanded(
                      flex: 1,
                      child: Container(
                        // color: Theme.of(context).scaffoldBackgroundColor,
                        child: TextFormField(
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Theme.of(context).textTheme.bodyText1.color,
                          ),
                          decoration: InputDecoration(
                            // fillColor: Theme.of(context).scaffoldBackgroundColor,
                            fillColor: Theme.of(context).canvasColor,
                            filled: true,
                            // border: InputBorder.none,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            hintText: '添加评论',
                            isDense: true,
                            contentPadding: EdgeInsets.fromLTRB(Dimens.gap_dp16 / 2, Dimens.gap_dp16 / 3, Dimens.gap_dp16 / 2, Dimens.gap_dp16 / 3),
                          ),
                          textAlign: TextAlign.start,
                          autocorrect: false,
                          autofocus: false,
                          // obscureText: widget.obscureText,
                          // onChanged: widget.onChanged,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                      child: null,
                    ),
                    IconFont(IconNames.heart, size: 24),
                    SizedBox(width: 20),
                    IconFont(IconNames.xiaoxi, size: 18),
                    SizedBox(width: 20),
                    GestureDetector(
                      child: IconFont(IconNames.send_s, size: 24),
                      onTap: handleScreenShot,
                    ),
                    // IconFont(IconNames.shoucang, size: 18),
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
