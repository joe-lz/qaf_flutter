import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'package:qaf_flutter/components/navigator.dart';
import 'package:qaf_flutter/constants.dart';

class WebviewScreen extends StatefulWidget {
  WebviewScreen({Key key, this.url = 'https://www.baidu.com'}) : super(key: key);
  final String url;
  @override
  _WebviewScreenState createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    // return Container(
    //   color: kBackgroundColor,
    //   child: Column(
    //     children: [
    //       NavigatorItem(),
    //       WebviewScaffold(
    //         url: 'https://www.baidu.com',
    //       )
    //     ],
    //   ),
    // );
    return WebviewScaffold(
      url: widget.url,
      appBar: AppBar(
        title: Text(''),
        elevation: 0,
      ),
    );
  }
}

class MenuSingle {}
