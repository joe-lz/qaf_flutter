import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:provider/provider.dart';
import 'package:qaf_flutter/components/modal_login.dart';
import 'package:qaf_flutter/provider/post.dart';
import 'package:qaf_flutter/provider/theme/index.dart';
import 'package:qaf_flutter/provider/global.dart';
import 'package:qaf_flutter/provider/counter.dart';
import 'package:qaf_flutter/provider/user.dart';
import 'package:qaf_flutter/provider/user_profile.dart';
import 'package:qaf_flutter/screens/discover/index.dart';

import 'package:qaf_flutter/screens/main/index.dart';
import 'package:qaf_flutter/screens/home/index.dart';
import 'package:qaf_flutter/screens/home_detail/index.dart';
import 'package:qaf_flutter/screens/me/index.dart';
import 'package:qaf_flutter/screens/me_about/index.dart';
import 'package:qaf_flutter/screens/message/index.dart';
import 'package:qaf_flutter/screens/not_found/index.dart';
import 'package:qaf_flutter/screens/post_detail/index.dart';
import 'package:qaf_flutter/screens/post_edit/index.dart';
import 'package:qaf_flutter/screens/post_edit_next/PostEditNextScreenArguments.dart';
import 'package:qaf_flutter/screens/post_edit_next/index.dart';
import 'package:qaf_flutter/screens/post_list/index.dart';
import 'package:qaf_flutter/screens/profile/index.dart';
import 'package:qaf_flutter/screens/topic_list/index.dart';
import 'package:qaf_flutter/screens/webview/index.dart';
import 'package:qaf_flutter/screens/webview/WebviewScreenArguments.dart';

import 'env.development.dart' as env_dev;
import 'env.production.dart' as env_prod;

void main() async {
  const bool inProduction = const bool.fromEnvironment("dart.vm.product");
  const envConfig = inProduction ? env_prod.ENV_CONFIG : env_dev.ENV_CONFIG;
  // final envConfigJSON = jsonDecode(envConfig);
  final envConfigJSON = JsonDecoder().convert(envConfig);
  // leancloud初始化
  LeanCloud.initialize(
    envConfigJSON['LEANCLOUD_APPID'],
    envConfigJSON['LEANCLOUD_APPKEY'],
    server: envConfigJSON['LEANCLOUD_SERVER'],
    queryCache: new LCQueryCache(),
  );
  // 在 LeanCloud.initialize 初始化之后执行，开启 SDK 的调试日志（debug log）来方便追踪问题
  // 在应用发布之前，请关闭调试日志，以免暴露敏感数据。
  // LCLogger.setLevel(LCLogger.DebugLevel);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
        ChangeNotifierProvider<GlobalModal>(create: (_) => GlobalModal()),
        ChangeNotifierProvider<CounterModal>(create: (_) => CounterModal()),
        ChangeNotifierProvider<UserModal>(create: (_) => UserModal()),
        ChangeNotifierProvider<UserProfileModal>(create: (_) => UserProfileModal()),
        ChangeNotifierProvider<PostModal>(create: (_) => PostModal()),
      ],
      child: EasyLocalization(
        saveLocale: false,
        useOnlyLangCode: true,
        supportedLocales: [
          Locale('en'),
          Locale('zh'),
        ],
        path: 'assets/translations',
        fallbackLocale: Locale('en', 'US'),
        child: MyApp(),
      ),
    ),
  );

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
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      // showPerformanceOverlay: true, //显示性能标签
      debugShowCheckedModeBanner: false, // 去除右上角debug的标签
      // checkerboardRasterCacheImages: true,
      // showSemanticsDebugger: true, // 显示语义视图
      // checkerboardOffscreenLayers: true, // 检查离屏渲染

      // theme: ThemeData(
      //   // brightness: Brightness.dark,
      //   primarySwatch: Colors.deepPurple,
      //   // backgroundColor: kBackgroundColor,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      theme: context.watch<ThemeProvider>().getTheme(),
      darkTheme: context.watch<ThemeProvider>().getTheme(isDarkMode: true),
      // themeMode: context.watch<ThemeProvider>().getThemeMode(),
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
            return MaterialWithModalsPageRoute(builder: (context) => MainScreen());
          case '/home':
            return MaterialPageRoute(builder: (context) => HomeScreen());
          case '/home_detail':
            return MaterialPageRoute(builder: (context) => HomeDetailScreen());

          case '/post_list':
            return MaterialPageRoute(builder: (context) => PostListScreen());
          case '/post_edit':
            return MaterialPageRoute(builder: (context) => PostEditScreen());
          case '/post_edit_next':
            final PostEditNextScreenArguments args = settings.arguments;
            return MaterialPageRoute(builder: (context) => PostEditNextScreen(data: args.data));
          case '/post_detail':
            return MaterialPageRoute(builder: (context) => PostDetailScreen());
          case '/topic_list':
            return MaterialPageRoute(builder: (context) => TopicListScreen());

          case '/discover':
            return MaterialPageRoute(builder: (context) => DiscoverScreen());

          case '/me':
            return MaterialPageRoute(builder: (context) => MeScreen());
          case '/me_about':
            return MaterialPageRoute(builder: (context) => MeAboutScreen());

          case '/message':
            return MaterialPageRoute(builder: (context) => MessageScreen());
          case '/profile':
            return MaterialWithModalsPageRoute(builder: (context) => ProfileScreen());
          case '/webview':
            final WebviewScreenArguments args = settings.arguments;
            return MaterialPageRoute(builder: (context) => WebviewScreen(url: args.url));
          case '/login':
            return MaterialPageRoute(builder: (context) => ModalLogin());
          default:
            return MaterialPageRoute(builder: (context) => NotFoundScreen());
        }
      },
    );
  }
}
