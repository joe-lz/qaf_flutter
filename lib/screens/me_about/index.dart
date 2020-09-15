import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qaf_flutter/components/navigator.dart';

class MeAboutScreen extends StatefulWidget {
  @override
  _MeAboutScreenState createState() => _MeAboutScreenState();
}

class _MeAboutScreenState extends State<MeAboutScreen> {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Container(
      child: Column(
        children: [
          NavigatorItem(),
          SingleChildScrollView(
            child: null,
          )
        ],
      ),
    );
  }
}

class MenuSingle {}
