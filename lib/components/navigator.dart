import 'package:flutter/material.dart';

class NavigatorItem extends StatefulWidget {
  NavigatorItem({Key key}) : super(key: key);

  @override
  _NavigatorItemState createState() => _NavigatorItemState();
}

class _NavigatorItemState extends State<NavigatorItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        top: true,
        bottom: false,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 44,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 44,
                  height: 44,
                  child: Icon(
                    Icons.chevron_left,
                    size: 30,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
