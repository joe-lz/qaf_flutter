import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:leancloud_storage/leancloud.dart';

class GlobalModal with ChangeNotifier {
  // BuildContext context;

  ///app的名字
  String appName = "qaf_flutter";

  bool _disableHomeSwipe = false;
  bool get disableHomeSwipe => _disableHomeSwipe;
  void updateDisableHomeSwipe(value) {
    _disableHomeSwipe = value;
    notifyListeners();
  }

  // getCurrentUser() async {
  //   currentUser = await LCUser.getCurrent();
  // }
  // getTheme() {
  //   var brightness = SchedulerBinding.instance.window.platformBrightness;
  //   bool darkModeOn = brightness == Brightness.dark;
  //   return darkModeOn ? ThemeDark() : ThemeLight();
  // }

  setStatusBar() {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    SystemChrome.setSystemUIOverlayStyle(darkModeOn ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark);
  }
}
