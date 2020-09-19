import 'package:flutter/material.dart';
import 'package:leancloud_storage/leancloud.dart';

class UserModal with ChangeNotifier {
  LCUser _currentUser;
  LCUser _myProfile;

  LCUser get currentUser => _currentUser;
  LCUser get myProfile => _myProfile;

  // 获取当前用户
  void getCurrentUser() async {
    _currentUser = await LCUser.getCurrent();
    notifyListeners();
  }

  // 注册
  Future handleSignup(String username, String password) async {
    LCUser user = LCUser();
    user.username = username;
    user.password = password;
    await user.signUp();
    _currentUser = await LCUser.getCurrent();
    notifyListeners();
  }

  // 登录
  Future handleLogin(String username, String password) async {
    _currentUser = await LCUser.login(username, password);
    notifyListeners();
  }

  // 退出登录
  Future handleLogout() async {
    await LCUser.logout();
    _currentUser = null;
    notifyListeners();
  }
}
