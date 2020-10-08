import 'package:flutter/material.dart';
import 'package:leancloud_storage/leancloud.dart';

class UserProfileModal with ChangeNotifier {
  LCObject _myUserProfile;
  LCObject get myUserProfile => _myUserProfile;

  // 获取我的资料
  Future getMyUserProfile() async {
    LCQuery<LCObject> query = LCQuery('UserProfile');
    LCUser _currentUser = await LCUser.getCurrent();
    if (_currentUser != null) {
      query.whereEqualTo('user', _currentUser);
      _myUserProfile = await query.first();
      if (_myUserProfile == null) {
        await createMyUserProfile();
      }
      notifyListeners();
    }
    return _myUserProfile;
  }

  // 创建我的资料
  Future createMyUserProfile() async {
    LCUser _currentUser = await LCUser.getCurrent();
    LCObject myUserProfile = LCObject("UserProfile");

    myUserProfile['user'] = _currentUser;
    myUserProfile['username'] = _currentUser.username;

    _myUserProfile = await myUserProfile.save();
    notifyListeners();
    return _myUserProfile;
  }

  // 更新我的资料
  Future updateMyUserProfile(Map params) async {
    params.forEach((key, value) {
      _myUserProfile[key] = value;
    });
    await _myUserProfile.save();
    await getMyUserProfile();
    notifyListeners();
    return _myUserProfile;
  }
}
