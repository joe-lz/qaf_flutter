import 'package:flutter/material.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:qaf_flutter/constants.dart';
import 'package:qaf_flutter/screens/main/index.dart';

void main() async {
  LeanCloud.initialize(
    'kYoKXYsCd0Q0YMjy4PsprIY4-gzGzoHsz',
    'wFHuzS3SOS0Y4QFhYz8XUSrd',
    server: 'https://leancloud-api-xh.todokit.xyz',
    queryCache: new LCQueryCache(),
  );
  LCLogger.setLevel(LCLogger.DebugLevel);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: kBackgroundColor,
      ),
      home: MainScreen(),
    );
  }
}
