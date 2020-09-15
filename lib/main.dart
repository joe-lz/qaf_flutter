import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:provider/provider.dart';

// import 'package:qaf_flutter/provider/global.dart';
import 'package:qaf_flutter/provider/theme_provider/index.dart';

import 'package:qaf_flutter/screens/main/index.dart';
import 'package:qaf_flutter/screens/home/index.dart';
import 'package:qaf_flutter/screens/home_detail/index.dart';
import 'package:qaf_flutter/screens/me/index.dart';
import 'package:qaf_flutter/screens/me_about/index.dart';
import 'package:qaf_flutter/screens/message/index.dart';
import 'package:qaf_flutter/screens/not_found/index.dart';

import 'package:qaf_flutter/screens/webview/index.dart';
import 'package:qaf_flutter/screens/webview/WebviewScreenArguments.dart';

void main() async {
  const bool inProduction = const bool.fromEnvironment("dart.vm.product");
  if (inProduction) {
    // leancloud初始化
    LeanCloud.initialize(
      'VvMQI9t9enJmUMlBqTm5mzKa-gzGzoHsz',
      'rMgD7Tvnr5qNjA0TLnV6eFL3',
      server: 'https://leanblog-api.todokit.xyz',
      queryCache: new LCQueryCache(),
    );
  } else {
    // leancloud初始化
    LeanCloud.initialize(
      'VvMQI9t9enJmUMlBqTm5mzKa-gzGzoHsz',
      'rMgD7Tvnr5qNjA0TLnV6eFL3',
      server: 'https://leanblog-api.todokit.xyz',
      queryCache: new LCQueryCache(),
    );
    // 在 LeanCloud.initialize 初始化之后执行，开启 SDK 的调试日志（debug log）来方便追踪问题
    // 在应用发布之前，请关闭调试日志，以免暴露敏感数据。
    LCLogger.setLevel(LCLogger.DebugLevel);
  }

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
    return ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (_, provider, __) {
          return MaterialApp(
            // showPerformanceOverlay: true, //显示性能标签
            // debugShowCheckedModeBanner: false, // 去除右上角debug的标签
            // checkerboardRasterCacheImages: true,
            // showSemanticsDebugger: true, // 显示语义视图
            // checkerboardOffscreenLayers: true, // 检查离屏渲染

            // theme: ThemeData(
            //   // brightness: Brightness.dark,
            //   primarySwatch: Colors.deepPurple,
            //   // backgroundColor: kBackgroundColor,
            //   visualDensity: VisualDensity.adaptivePlatformDensity,
            // ),
            theme: provider.getTheme(),
            darkTheme: provider.getTheme(isDarkMode: true),
            // themeMode: provider.getThemeMode(),
            // themeMode: darkModeOn ? ThemeMode.dark : ThemeMode.light,
            builder: (context, child) {
              /// 保证文字大小不受手机系统设置影响 https://www.kikt.top/posts/flutter/layout/dynamic-text/
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: child,
              );
            },
            initialRoute: "/", // 名为"/"的路由作为应用的home(首页)
            // home: MainScreen(),
            // routes: {
            //   "/": (context) => MainScreen(), //注册首页路由
            //   "/webview": (context) => WebviewScreen(),
            // },
            onGenerateRoute: (settings) {
              String routeName = settings.name;
              switch (routeName) {
                case '/':
                  return MaterialPageRoute(builder: (context) => MainScreen());
                case '/home':
                  return MaterialPageRoute(builder: (context) => HomeScreen());
                case '/home_detail':
                  return MaterialPageRoute(builder: (context) => HomeDetailScreen());

                case '/message':
                  return MaterialPageRoute(builder: (context) => MessageScreen());

                case '/webview':
                  final WebviewScreenArguments args = settings.arguments;
                  return MaterialPageRoute(builder: (context) => WebviewScreen(url: args.url));

                case '/me':
                  return MaterialPageRoute(builder: (context) => MeScreen());
                case '/me_about':
                  return MaterialPageRoute(builder: (context) => MeAboutScreen());

                default:
                  return MaterialPageRoute(builder: (context) => NotFoundScreen());
              }
            },
          );
        },
      ),
    );
  }
}
