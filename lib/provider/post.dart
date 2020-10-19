import 'package:flutter/material.dart';
import 'package:leancloud_storage/leancloud.dart';

class PostModal with ChangeNotifier {
  LCObject _myPost;
  LCObject get myPost => _myPost;

  // 创建
  Future createMyPost({
    List images,
    String title,
    String imgType,
    String rights,
  }) async {
    LCUser _currentUser = await LCUser.getCurrent();
    LCObject myPost = LCObject("Post");

    myPost['user'] = _currentUser;
    myPost['imaegs'] = images;
    myPost['title'] = title;
    myPost['imgType'] = imgType;
    myPost['rights'] = rights;

    _myPost = await myPost.save();
    notifyListeners();
    return _myPost;
  }
}
