import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:qaf_flutter/provider/theme/dimens.dart';
import 'package:qaf_flutter/utils/screen_utils.dart';

class PostItemComponent extends StatefulWidget {
  PostItemComponent({
    Key key,
    this.imageUrl,
  }) : super(key: key);
  String imageUrl;

  @override
  _PostItemComponentState createState() => _PostItemComponentState();
}

class _PostItemComponentState extends State<PostItemComponent> {
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
                child: Row(
                  children: [
                    ClipOval(
                      child: Container(
                        width: 35,
                        height: 35,
                        color: Theme.of(context).scaffoldBackgroundColor,
                        child: Image.network(
                          "https://images.pexels.com/photos/3236735/pexels-photo-3236735.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
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
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(top: Dimens.gap_dp16 / 2),
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
              Padding(
                padding: EdgeInsets.fromLTRB(
                  Dimens.gap_dp16 / 2,
                  Dimens.gap_dp16,
                  Dimens.gap_dp16 / 2,
                  Dimens.gap_dp16,
                ),
                child: Row(
                  children: [
                    Icon(Icons.share, size: 24),
                    SizedBox(width: 15),
                    Icon(Icons.message, size: 24),
                    SizedBox(width: 15),
                    Icon(Icons.send, size: 24),
                    Spacer(),
                    Icon(Icons.tag_faces, size: 24),
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
