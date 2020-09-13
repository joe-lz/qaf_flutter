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
    this.unit,
  }) : super(key: key);
  final desc;
  final String descHint;
  final bool showIconRight;
  final Color colorDesc;
  final Color colorDescHint;
  final String unit;

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
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        widget.desc != null
            ? Padding(
                padding: EdgeInsets.only(right: widget.showIconRight ? 0 : DefaultPadding / 2),
                child: Row(
                  children: [
                    Text(
                      '${widget.desc}',
                      style: TextStyle(
                        color: widget.colorDesc,
                      ),
                    ),
                    Text(widget.unit != null ? '${widget.unit}' : '')
                  ],
                ),
              )
            : Container(
                child: widget.descHint != null
                    ? Padding(
                        padding: EdgeInsets.only(right: widget.showIconRight ? 0 : DefaultPadding / 2),
                        child: Row(
                          children: [
                            Text(
                              widget.descHint,
                              style: TextStyle(
                                color: widget.colorDescHint,
                              ),
                            ),
                            // Text(widget.unit != null ? '${widget.unit}' : '')
                          ],
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
