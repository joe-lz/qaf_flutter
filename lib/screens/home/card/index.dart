import 'package:flutter/material.dart';
import 'package:qaf_flutter/provider/theme/dimens.dart';
import 'package:qaf_flutter/screens/home/card/content.dart';

class CardComponent extends StatefulWidget {
  CardComponent({Key key}) : super(key: key);

  @override
  _CardComponentState createState() => _CardComponentState();
}

class _CardComponentState extends State<CardComponent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Column(
        children: [
          Container(height: Dimens.nav_height, child: null),
          CardContentComponent(),
        ],
      ),
    );
  }
}
