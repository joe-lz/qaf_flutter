import 'package:flutter/material.dart';
import 'package:qaf_flutter/components/menu_item.dart';
import 'package:qaf_flutter/constants.dart';

class MenuGroup extends StatefulWidget {
  MenuGroup({Key key, this.menulist}) : super(key: key);
  final List<int> menulist;

  @override
  _MenuGroupState createState() => _MenuGroupState();
}

class _MenuGroupState extends State<MenuGroup> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(DefaultPadding, DefaultPadding / 2, DefaultPadding, DefaultPadding / 2),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Container(
          color: Colors.white,
          child: Column(
            children: widget.menulist.map((e) => MenuItem(title: '设置', showBorderBottom: true)).toList(),
          ),
        ),
      ),
    );
  }
}
