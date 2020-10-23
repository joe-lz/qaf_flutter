import 'package:flutter/material.dart';
import 'package:leancloud_storage/leancloud.dart';

class PostModal with ChangeNotifier {
  LCObject _myPost;
  LCObject get myPost => _myPost;

  List<LCObject> _postlist = [];
  List<LCObject> get postlist => _postlist;

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
    myPost['images'] = images;
    myPost['title'] = title;
    myPost['imgType'] = imgType;
    myPost['rights'] = rights;
    myPost['status'] = 1;

    _myPost = await myPost.save();
    notifyListeners();
    return _myPost;
  }

  // 获取post列表
  Future getPostList() async {
    LCQuery<LCObject> query = LCQuery('Post');
    query.whereEqualTo('status', 3);
    query.limit(10);
    query.orderByDescending('createdAt');
    _postlist = await query.find();
    notifyListeners();
    return _postlist;
  }
}
