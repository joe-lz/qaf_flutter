import 'package:flutter/material.dart';
import 'package:qaf_flutter/constants.dart';

class MenuGroup extends StatefulWidget {
  MenuGroup({Key key, this.children}) : super(key: key);
  final List<Widget> children;

  @override
  _MenuGroupState createState() => _MenuGroupState();
}

class _MenuGroupState extends State<MenuGroup> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(DefaultPadding, DefaultPadding / 2, DefaultPadding, DefaultPadding / 2),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(RadiusNormal)),
        child: Container(
          color: Colors.white,
          child: Column(
            children: widget.children,
          ),
        ),
      ),
    );
  }
}
