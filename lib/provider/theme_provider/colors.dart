import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Colours {
  static const Color app_main = Colors.deepPurple;
  static const Color dark_app_main = Colors.deepPurple;

  static const Color bg_color = Color.fromRGBO(242, 242, 246, 1.00);
  static const Color dark_bg_color = Color.fromRGBO(0, 0, 0, 1.00);

  static const Color bg_color_tabbar = Colors.white;
  static const Color dark_bg_color_tabbar = Color.fromRGBO(18, 19, 18, 1.00);

  static const Color material_bg = Colors.white;
  static const Color dark_material_bg = Color.fromRGBO(28, 28, 30, 1.00);

  static const Color red = Color(0xFFFF4759);
  static const Color dark_red = Color(0xFFE03E4E);

  static const Color line = Color(0xFFEEEEEE);
  static const Color dark_line = Color(0xFF3A3C3D);

  // Text
  static const Color text = Color(0xFF333333);
  static const Color dark_text = Color(0xFFB8B8B8);

  static const Color text_gray = Color(0xFF999999);
  static const Color dark_text_gray = Color(0xFF666666);

  static const Color text_disabled = Color(0xFFD4E2FA);
  static const Color dark_text_disabled = Color(0xFFCEDBF2);

  // static const Color bg_gray = Color(0xFFF6F6F6);
  // static const Color dark_bg_gray = Color(0xFF1F1F1F);

  // static const Color bg_gray_ = Color(0xFFFAFAFA);
  // static const Color dark_bg_gray_ = Color(0xFF242526);

  // static const Color text_gray = Color(0xFF999999);
  // static const Color dark_text_gray = Color(0xFF666666);

  // static const Color text_gray_c = Color(0xFFcccccc);
  // static const Color dark_button_text = Color(0xFFF2F2F2);

  // static const Color text_disabled = Color(0xFFD4E2FA);
  // static const Color dark_text_disabled = Color(0xFFCEDBF2);

  // static const Color button_disabled = Color(0xFF96BBFA);
  // static const Color dark_button_disabled = Color(0xFF83A5E0);

  // static const Color unselected_item_color = Color(0xffbfbfbf);
  // static const Color dark_unselected_item_color = Color(0xFF4D4D4D);

  getColor() {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    return darkModeOn ? DarkColor() : LightColor();
  }
}

class DarkColor {
  Color link_color = Color.fromRGBO(2, 127, 254, 1.00);
  Color error_color = Color.fromRGBO(244, 66, 54, 1.00);
  Color success_color = Color.fromRGBO(76, 175, 80, 1.00);
  Color waring_color = Color.fromRGBO(255, 152, 0, 1.00);
  Color info_color = Color.fromRGBO(34, 150, 243, 1.00);
}

class LightColor {
  Color link_color = Color.fromRGBO(2, 127, 254, 1.00);
  Color error_color = Color.fromRGBO(244, 66, 54, 1.00);
  Color success_color = Color.fromRGBO(76, 175, 80, 1.00);
  Color waring_color = Color.fromRGBO(255, 152, 0, 1.00);
  Color info_color = Color.fromRGBO(34, 150, 243, 1.00);
}
