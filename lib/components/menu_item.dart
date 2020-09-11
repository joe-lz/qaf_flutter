import 'package:flutter/material.dart';
import 'package:qaf_flutter/constants.dart';
import 'package:qaf_flutter/utils/screen_utils.dart';

class MenuItem extends StatefulWidget {
  MenuItem({
    Key key,
    this.title = 'title',
    this.action,
    this.showIconRight = true,
    this.showBorderBottom = false,
    this.active = false,
    this.activeColor = kPrimaryColor,
  }) : super(key: key);
  final String title;
  final Function action;
  final bool showIconRight;
  final bool showBorderBottom;
  final bool active;
  final Color activeColor;

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  // @override
  // void initState() {
  //   var data = widget.title;
  //   print(data);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          if (widget.action != null) {
            widget.action();
          }
        },
        child: Container(
          height: MenuHeight,
          width: ScreenUtils.screenW(context) - DefaultPadding * 2,
          child: Stack(
            children: [
              Positioned(
                left: DefaultPadding,
                top: MenuHeight - 1,
                child: Container(
                  width: ScreenUtils.screenW(context) - DefaultPadding * 2,
                  height: widget.showBorderBottom ? 0.5 : 0,
                  color: kBorderColor,
                  child: null,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(DefaultPadding, 0, DefaultPadding / 2, 0),
                child: Row(
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(color: widget.active ? widget.activeColor : null, fontSize: kFontSizeNormal),
                    ),
                    Expanded(
                      child: Container(
                        child: null,
                      ),
                    ),
                    widget.showIconRight
                        ? Container(
                            child: Icon(
                              Icons.chevron_right,
                              color: kDisabledColor,
                              size: 20,
                            ),
                          )
                        : Container(
                            child: null,
                          )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
