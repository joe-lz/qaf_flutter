import 'package:flutter/material.dart';
import 'package:qaf_flutter/constants.dart';

class MenuGroup extends StatefulWidget {
  MenuGroup({
    Key key,
    this.children,
    this.title,
  }) : super(key: key);
  final List<Widget> children;
  final String title;

  @override
  _MenuGroupState createState() => _MenuGroupState();
}

class _MenuGroupState extends State<MenuGroup> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(DefaultPadding, DefaultPadding / 2, DefaultPadding, DefaultPadding / 2),
      child: Column(
        children: [
          widget.title != null
              ? Padding(
                  padding: EdgeInsets.only(bottom: DefaultPadding / 2),
                  child: Row(
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: null,
                        ),
                      )
                    ],
                  ),
                )
              : Container(child: null),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(RadiusNormal)),
            child: Container(
              color: Colors.white,
              child: Column(
                children: widget.children,
              ),
            ),
          )
        ],
      ),
    );
  }
}
