import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaf_flutter/provider/counter.dart';
import 'package:qaf_flutter/provider/global.dart';

/// ProviderConfig  provider配置
class ProviderConfig {
  static ProviderConfig _instance;

  static ProviderConfig getInstance() {
    if (_instance == null) {
      _instance = ProviderConfig._internal();
    }
    return _instance;
  }

  ///全局
  ChangeNotifierProvider<GlobalModel> getGlobal(Widget child) {
    return ChangeNotifierProvider<GlobalModel>(
      create: (context) => GlobalModel(),
      child: child,
    );
  }

  ///登陆页面
  ChangeNotifierProvider<CounterModal> getLoginPage(Widget child) {
    return ChangeNotifierProvider<CounterModal>(
      create: (context) => CounterModal(),
      child: child,
    );
  }

  ProviderConfig._internal();
}
