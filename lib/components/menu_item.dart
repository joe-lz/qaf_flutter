import 'package:flutter/material.dart';
import 'package:qaf_flutter/constants.dart';

class MenuItem extends StatefulWidget {
  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(DefaultPadding, DefaultPadding, DefaultPadding, DefaultPadding),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        height: 44,
        width: MediaQuery.of(context).size.width - DefaultPadding * 2,
        child: Text('data'),
      ),
    );
  }
}
