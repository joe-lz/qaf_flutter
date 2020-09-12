import 'package:flutter/material.dart';
import 'package:qaf_flutter/constants.dart';
import 'package:qaf_flutter/utils/screen_utils.dart';

class MenuItemDisplay extends StatefulWidget {
  MenuItemDisplay({
    Key key,
    this.desc,
    this.descHint,
    this.showIconRight = false,
    this.colorDesc = kTextColor,
    this.colorDescHint = kDisabledColor,
  }) : super(key: key);
  final String desc;
  final String descHint;
  final bool showIconRight;
  final Color colorDesc;
  final Color colorDescHint;

  @override
  _MenuItemDisplayState createState() => _MenuItemDisplayState();
}

class _MenuItemDisplayState extends State<MenuItemDisplay> {
  // @override
  // void initState() {
  //   var data = widget.title;
  //   print(data);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        widget.desc != null
            ? Padding(
                padding: EdgeInsets.only(right: widget.showIconRight ? 0 : DefaultPadding / 2),
                child: Container(
                  child: Text(
                    widget.desc,
                    style: TextStyle(
                      color: widget.colorDesc,
                    ),
                  ),
                ),
              )
            : Container(
                child: widget.descHint != null
                    ? Padding(
                        padding: EdgeInsets.only(right: widget.showIconRight ? 0 : DefaultPadding / 2),
                        child: Container(
                          child: Text(
                            widget.descHint,
                            style: TextStyle(
                              color: widget.colorDescHint,
                            ),
                          ),
                        ),
                      )
                    : Text(''),
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
    );
  }
}
