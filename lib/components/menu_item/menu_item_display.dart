import 'package:flutter/material.dart';
import 'package:qaf_flutter/provider/theme/dimens.dart';

class MenuItemDisplay extends StatefulWidget {
  MenuItemDisplay({
    Key key,
    this.desc,
    this.descHint,
    this.showIconRight = false,
    this.colorDesc,
    this.unit,
  }) : super(key: key);
  final desc;
  final String descHint;
  final bool showIconRight;
  final Color colorDesc;
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
                padding: EdgeInsets.only(right: widget.showIconRight ? 0 : Dimens.gap_dp16 / 2),
                child: Row(
                  children: [
                    Text(
                      '${widget.desc}',
                      style: TextStyle(
                        color: widget.colorDesc,
                        fontSize: Theme.of(context).textTheme.subtitle1.fontSize,
                      ),
                    ),
                    Text(
                      widget.unit != null ? '${widget.unit}' : '',
                      style: Theme.of(context).textTheme.subtitle1,
                    )
                  ],
                ),
              )
            : Container(
                // desc null的占位符
                child: widget.descHint != null
                    ? Padding(
                        padding: EdgeInsets.only(right: widget.showIconRight ? 0 : Dimens.gap_dp16 / 2),
                        child: Row(
                          children: [
                            Text(
                              widget.descHint,
                              style: TextStyle(
                                color: Theme.of(context).textTheme.caption.color,
                                fontSize: Theme.of(context).textTheme.subtitle1.fontSize,
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
                  color: Theme.of(context).textTheme.caption.color,
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
