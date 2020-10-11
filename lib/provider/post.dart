import 'package:flutter/material.dart';
import 'package:leancloud_storage/leancloud.dart';

class PostModal with ChangeNotifier {
  LCObject _myPost;
  LCObject get myPost => _myPost;

  // 创建
  Future createMyPost(List images) async {
    LCUser _currentUser = await LCUser.getCurrent();
    LCObject myPost = LCObject("Post");

    myPost['user'] = _currentUser;
    myPost['imaegs'] = images;

    _myPost = await myPost.save();
    notifyListeners();
    return _myPost;
  }
}
