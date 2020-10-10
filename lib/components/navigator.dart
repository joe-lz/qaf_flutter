import 'package:flutter/material.dart';
import 'package:qaf_flutter/provider/theme/dimens.dart';
import 'package:qaf_flutter/utils/screen_utils.dart';

class NavigatorItem extends StatefulWidget {
  NavigatorItem({
    Key key,
    this.backgroundColor,
  }) : super(key: key);
  final Color backgroundColor;

  @override
  _NavigatorItemState createState() => _NavigatorItemState();
}

class _NavigatorItemState extends State<NavigatorItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor,
      child: SafeArea(
        top: true,
        bottom: false,
        child: Container(
          width: ScreenUtils.screenW(context),
          height: Dimens.nav_height,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: Dimens.nav_height,
                  height: Dimens.nav_height,
                  child: Icon(
                    Icons.chevron_left,
                    size: 30,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: null,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: Dimens.nav_height,
                  height: Dimens.nav_height,
                  child: Icon(
                    Icons.share,
                    size: 20,
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
