import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:qaf_flutter/constants.dart';
import 'package:qaf_flutter/screens/main/index.dart';

void main() async {
  // leancloud初始化
  LeanCloud.initialize(
    'kYoKXYsCd0Q0YMjy4PsprIY4-gzGzoHsz',
    'wFHuzS3SOS0Y4QFhYz8XUSrd',
    server: 'https://leancloud-api-xh.todokit.xyz',
    queryCache: new LCQueryCache(),
  );
  // 在 LeanCloud.initialize 初始化之后执行，开启 SDK 的调试日志（debug log）来方便追踪问题
  // 在应用发布之前，请关闭调试日志，以免暴露敏感数据。
  LCLogger.setLevel(LCLogger.DebugLevel);

  runApp(MyApp());

  //设置Android头部的导航栏透明
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,
        backgroundColor: kBackgroundColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(),
    );
  }
}
