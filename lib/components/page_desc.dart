import 'package:flutter/material.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:qaf_flutter/provider/theme_provider/dimens.dart';

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
      padding: EdgeInsets.fromLTRB(Dimens.gap_dp16, Dimens.gap_dp16, Dimens.gap_dp16, Dimens.gap_dp16),
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
