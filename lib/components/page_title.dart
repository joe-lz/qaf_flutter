import 'package:flutter/material.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:qaf_flutter/constants.dart';

class PageTitle extends StatefulWidget {
  PageTitle({
    Key key,
    this.title = 'PageTitle',
    this.right,
  }) : super(key: key);
  final String title;
  final Widget right;

  @override
  _PageTitleState createState() => _PageTitleState();
}

class _PageTitleState extends State<PageTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(DefaultPadding, DefaultPadding * 2, DefaultPadding, DefaultPadding / 2),
      child: Row(
        children: [
          Text(
            widget.title,
            style: TextStyle(fontSize: Theme.of(context).textTheme.headline4.fontSize, fontWeight: FontWeight.w500),
          ),
          Expanded(
            child: Container(
              child: null,
            ),
          ),
          widget.right != null
              ? widget.right
              : Container(
                  child: null,
                )
        ],
      ),
    );
  }
}
