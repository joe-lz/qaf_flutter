import 'package:flutter/material.dart';
import 'package:qaf_flutter/provider/theme/dimens.dart';

class DiscoverBlockComponent extends StatefulWidget {
  DiscoverBlockComponent({
    Key key,
    this.title = 'Title',
    this.child,
  }) : super(key: key);
  String title;
  Widget child;
  @override
  _DiscoverBlockComponentState createState() => _DiscoverBlockComponentState();
}

class _DiscoverBlockComponentState extends State<DiscoverBlockComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            // Padding(
            //   padding: EdgeInsets.fromLTRB(Dimens.gap_dp16, Dimens.gap_dp16, Dimens.gap_dp16, 0),
            //   child: Text(
            //     widget.title,
            //     style: Theme.of(context).textTheme.headline6,
            //   ),
            // ),
            Spacer(),
          ],
        ),
        widget.child,
      ],
    );
  }
}
