import 'package:flutter/material.dart';
import 'package:qaf_flutter/components/menu_item.dart';
import 'package:qaf_flutter/constants.dart';

class MenuOne extends StatefulWidget {
  MenuOne({
    Key key,
    this.title = 'title',
    this.desc,
    this.descHint,
    this.action,
    this.showIconRight = false,
    this.showBorderBottom = false,
    this.type = 'normal', // normal, active, disabled
    this.colorTitle = kTextColor,
    this.colorDesc = kTextColor,
    this.colorDescHint = kDisabledColor,
  }) : super(key: key);
  final String title;
  final String desc;
  final String descHint;
  final Function action;
  final bool showIconRight;
  final bool showBorderBottom;
  final String type;
  final Color colorTitle;
  final Color colorDesc;
  final Color colorDescHint;

  @override
  _MenuOneState createState() => _MenuOneState();
}

class _MenuOneState extends State<MenuOne> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(DefaultPadding, DefaultPadding / 2, DefaultPadding, DefaultPadding / 2),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(RadiusNormal)),
        child: MenuItem(
          title: widget.title,
          desc: widget.desc,
          descHint: widget.descHint,
          action: widget.action,
          showIconRight: widget.showIconRight,
          showBorderBottom: widget.showBorderBottom,
          type: widget.type,
          colorTitle: widget.colorTitle,
          colorDescHint: widget.colorDescHint,
        ),
      ),
    );
  }
}
