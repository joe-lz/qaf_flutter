import 'package:flutter/material.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:qaf_flutter/constants.dart';

class PageDesc extends StatefulWidget {
  PageDesc({
    Key key,
    this.title = 'PageDesc',
  }) : super(key: key);
  final String title;

  @override
  _PageDescState createState() => _PageDescState();
}

class _PageDescState extends State<PageDesc> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(DefaultPadding, DefaultPadding, DefaultPadding, DefaultPadding),
      child: Row(
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 12,
              // color: kColorError,
            ),
          ),
          Expanded(
            child: Container(
              child: null,
            ),
          ),
        ],
      ),
    );
  }
}
