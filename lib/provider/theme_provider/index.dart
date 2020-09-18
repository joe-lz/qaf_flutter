import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:qaf_flutter/provider/theme_provider/colors.dart';
import 'package:qaf_flutter/provider/theme_provider/styles.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode getThemeMode() {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    final String theme = darkModeOn ? 'Dark' : 'Light';
    switch (theme) {
      case 'Dark':
        return ThemeMode.dark;
      case 'Light':
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  ThemeData getTheme({bool isDarkMode = false}) {
    return ThemeData(
      // errorColor: isDarkMode ? Colours.dark_red : Colours.red,
      accentColor: isDarkMode ? Colours.dark_app_main : Colours.app_main,
      primaryColor: isDarkMode ? Colours.dark_app_main : Colours.app_main,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      primarySwatch: isDarkMode ? Colours.dark_app_main : Colours.app_main,
      // Tab指示器颜色
      // indicatorColor: isDarkMode ? Colours.dark_app_main : Colours.app_main,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: isDarkMode ? Colours.dark_bg_color_tabbar : Colours.bg_color_tabbar,
      ),
      // 页面背景色
      scaffoldBackgroundColor: isDarkMode ? Colours.dark_bg_color : Colours.bg_color,
      // 主要用于Material背景色，块的颜色
      canvasColor: isDarkMode ? Colours.dark_material_bg : Colours.material_bg,
      // 文字选择色（输入框复制粘贴菜单）
      // textSelectionColor: Colours.app_main.withAlpha(70),
      // textSelectionHandleColor: Colours.app_main,
      textTheme: TextTheme(
        // TextField输入文字颜色
        // subtitle1: isDarkMode ? TextStyles.textDark : TextStyles.text,
        // Text文字样式
        // bodyText2: isDarkMode ? TextStyles.textDark : TextStyles.text,
        // subtitle2: isDarkMode ? TextStyles.textDarkGray12 : TextStyles.textGray12,
        caption: isDarkMode ? TextStyles.dark_textGray12 : TextStyles.textGray12,
      ),
      // inputDecorationTheme: InputDecorationTheme(
      //   hintStyle: isDarkMode ? TextStyles.textHint14 : TextStyles.textDarkGray14,
      // ),
      // appBarTheme: AppBarTheme(
      //   elevation: 0.0,
      //   color: isDarkMode ? Colours.dark_bg_color : Colors.white,
      //   brightness: isDarkMode ? Brightness.dark : Brightness.light,
      // ),
      dividerTheme: DividerThemeData(
        color: isDarkMode ? Colours.dark_line : Colours.line,
        space: 0.6,
        thickness: 0.6,
      ),
      // cupertinoOverrideTheme: CupertinoThemeData(
      //   brightness: isDarkMode ? Brightness.dark : Brightness.light,
      // ),
      // pageTransitionsTheme: NoTransitionsOnWeb(),
    );
  }
}
