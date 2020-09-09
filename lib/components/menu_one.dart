import 'package:flutter/material.dart';
import 'package:qaf_flutter/components/menu_item.dart';
import 'package:qaf_flutter/constants.dart';

class MenuOne extends StatefulWidget {
  MenuOne({Key key, this.title = 'title', this.action, this.showIconRight = true, this.showBorderBottom = false, this.active = false}) : super(key: key);
  final String title;
  final Function action;
  final bool showIconRight;
  final bool showBorderBottom;
  final bool active;

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
        child: MenuItem(title: widget.title, action: widget.action, showIconRight: widget.showIconRight, active: widget.active),
      ),
    );
  }
}
