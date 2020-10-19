// 话题内容列表
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';
import 'package:image_crop/image_crop.dart';

import 'package:qaf_flutter/provider/post.dart';
import 'package:qaf_flutter/provider/theme/colors.dart';
import 'package:qaf_flutter/provider/theme/dimens.dart';
import 'package:qaf_flutter/screens/post_edit/add.dart';
import 'package:qaf_flutter/screens/post_edit_next/PostEditNextScreenArguments.dart';
import 'package:qaf_flutter/utils/screen_utils.dart';

class PostEditScreen extends StatefulWidget {
  PostEditScreen({Key key}) : super(key: key);

  @override
  _PostEditScreenState createState() => _PostEditScreenState();
}

class _PostEditScreenState extends State<PostEditScreen> {
  int _currentIndex = 0;
  final _picker = ImagePicker();
  List imagelistLocal = [PostImagesLocal()];
  final cropKey = GlobalKey<CropState>();
  OverlayEntry overlayEntry;

  @override
  void dispose() {
    super.dispose();
  }

  // 获取图片
  Future getImage() async {
    PickedFile _pickedFile = await _picker.getImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );
    File file = File(_pickedFile.path);
    setState(() {
      if (_pickedFile != null) {
        imagelistLocal.insert(
          imagelistLocal.length - 1,
          PostImagesLocal(imageFile: file),
        );
      } else {
        print('No image selected.');
      }
    });
  }

  // 下一步/上传图片
  Future handleSubmit() async {
    Navigator.pushNamed(
      context,
      "/post_edit_next",
      arguments: PostEditNextScreenArguments(imagelistLocal),
    );
  }

  // 删除图片item
  removeItem(int index) {
    imagelistLocal.removeAt(index);
    setState(() {});
  }

  // 更新图片item mode
  updateItemMode(int index) {
    final curItem = imagelistLocal[index];
    imagelistLocal[index] = PostImagesLocal(
      mode: curItem.mode == 'cover' ? 'contain' : 'cover',
      imageFile: curItem.imageFile,
    );
    setState(() {});
  }

  // 更新图片item 替换当前图片
  updateItemImg(int index) async {
    final curItem = imagelistLocal[index];
    PickedFile _pickedFile = await _picker.getImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );
    File file = File(_pickedFile.path);
    setState(() {
      if (_pickedFile != null) {
        imagelistLocal[index] = PostImagesLocal(
          mode: 'cover',
          imageFile: file,
        );
      } else {
        print('No image selected.');
      }
    });
  }

  showCropImgModal(int index) {
    overlayEntry = OverlayEntry(builder: (context) {
      // 外层使用Positioned进行定位，控制在Overlay中的位置
      return Material(
        // color: Theme.of(context).canvasColor,
        color: Colors.grey[900],
        child: SafeArea(
          child: Column(
            children: [
              // Text(
              //   '双指缩放跳转',
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: Theme.of(context).textTheme.bodyText1.fontSize,
              //   ),
              // ),
              Expanded(
                child: Center(
                  child: Container(
                    width: ScreenUtils.screenW(context) - Dimens.gap_dp16,
                    height: ScreenUtils.screenW(context) - Dimens.gap_dp16,
                    child: Crop.file(
                      imagelistLocal[index].imageFile,
                      key: cropKey,
                      alwaysShowGrid: true,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(Dimens.gap_dp16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () => hideCropModal(),
                    ),
                    Text(
                      '双指缩放调整',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Theme.of(context).textTheme.bodyText1.fontSize,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.done,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () => _cropImage(index),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
    //往Overlay中插入插入OverlayEntry
    Overlay.of(context).insert(overlayEntry);
    //两秒后，移除Toast
    // Future.delayed(Duration(seconds: 10)).then((value) {
    //   overlayEntry.remove();
    // });
  }

  // 切图
  Future<void> _cropImage(int index) async {
    final scale = cropKey.currentState.scale;
    final area = cropKey.currentState.area;
    if (area == null) {
      // cannot crop, widget is not setup
      return;
    }
    // scale up to use maximum possible number of pixels
    // this will sample image in higher resolution to make cropped image larger
    final sample = await ImageCrop.sampleImage(
      file: imagelistLocal[index].imageFile,
      preferredSize: (2000 / scale).round(),
    );
    final cropedfile = await ImageCrop.cropImage(
      file: sample,
      area: area,
    );
    // debugPrint('$file');
    setState(() {
      if (cropedfile != null) {
        imagelistLocal[index] = PostImagesLocal(
          mode: 'cover',
          imageFile: cropedfile,
        );
        hideCropModal();
      } else {
        print('No image selected.');
      }
    });
  }

  hideCropModal() {
    overlayEntry.remove();
    overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        top: true,
        bottom: true,
        child: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: Column(
            children: [
              Container(
                height: Dimens.nav_height,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: Dimens.nav_height,
                        height: Dimens.nav_height,
                        child: Icon(
                          Icons.close,
                          size: 20,
                        ),
                      ),
                    ),
                    imagelistLocal.length > 1
                        ? CupertinoButton(
                            // padding: EdgeInsets.all(0),
                            child: Text(
                              '下一步',
                              style: TextStyle(
                                fontSize: Theme.of(context).textTheme.bodyText1.fontSize,
                                fontWeight: FontWeight.w700,
                                // color: Theme.of(context).primaryColor,
                              ),
                            ),
                            onPressed: () {
                              handleSubmit();
                            },
                          )
                        : Container(
                            child: null,
                          ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(height: 100),
                    Container(
                      width: ScreenUtils.screenW(context),
                      child: SizedBox(
                        // height: ScreenUtils.screenW(context) * 0.85,
                        height: ScreenUtils.screenW(context) + Dimens.gap_dp16 * 3,
                        child: Swiper(
                          index: _currentIndex,
                          loop: false,
                          itemCount: imagelistLocal.length,
                          viewportFraction: 0.85,
                          scale: 1,
                          onIndexChanged: (int index) {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              // color: Colors.red,
                              child: Padding(
                                padding: EdgeInsets.all(Dimens.gap_dp16),
                                child: Container(
                                  // decoration: BoxDecoration(
                                  //   color: Theme.of(context).canvasColor,
                                  // boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 5, blurRadius: 5, offset: Offset(0, 0))],
                                  //   border: Border(bottom: BorderSide(width: 0.5, color: Theme.of(context).dividerTheme.color)),
                                  // ),
                                  child: index != imagelistLocal.length - 1
                                      ? imagelistLocal[index].imageFile != null
                                          ? Column(
                                              children: [
                                                Container(
                                                  width: ScreenUtils.screenW(context) * 0.85,
                                                  height: ScreenUtils.screenW(context) * 0.85,
                                                  decoration: BoxDecoration(
                                                    color: Theme.of(context).canvasColor,
                                                    boxShadow: [
                                                      // BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 5, blurRadius: 5, offset: Offset(0, 0))
                                                    ],
                                                    // border: Border(bottom: BorderSide(width: 0.5, color: Theme.of(context).dividerTheme.color)),
                                                    // border: Border.all(width: 0.5, color: Colors.red),
                                                  ),
                                                  child: Image.file(
                                                    imagelistLocal[index].imageFile,
                                                    fit: imagelistLocal[index].mode == 'contain' ? BoxFit.contain : BoxFit.cover,
                                                  ),
                                                ),
                                                Container(height: Dimens.gap_dp16),
                                                Visibility(
                                                  visible: index == _currentIndex,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      IconButton(
                                                        icon: Icon(
                                                          Icons.crop,
                                                          color: Theme.of(context).textTheme.caption.color,
                                                          size: 20,
                                                        ),
                                                        onPressed: () => showCropImgModal(_currentIndex),
                                                      ),
                                                      IconButton(
                                                        icon: Icon(
                                                          Icons.aspect_ratio,
                                                          color: Theme.of(context).textTheme.caption.color,
                                                          size: 20,
                                                        ),
                                                        onPressed: () => updateItemMode(_currentIndex),
                                                      ),
                                                      IconButton(
                                                        icon: Icon(
                                                          Icons.cached,
                                                          color: Theme.of(context).textTheme.caption.color,
                                                          size: 20,
                                                        ),
                                                        onPressed: () => updateItemImg(_currentIndex),
                                                      ),
                                                      IconButton(
                                                        icon: Icon(
                                                          Icons.restore_from_trash,
                                                          color: Theme.of(context).textTheme.caption.color,
                                                          size: 20,
                                                        ),
                                                        onPressed: () => removeItem(_currentIndex),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                          : Container()
                                      : PostAddComponent(handleAdd: getImage),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    // Container(
                    //   child: Text('data'),
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PostImagesLocal {
  final String mode; // contain、cover
  final File imageFile;

  const PostImagesLocal({
    this.mode = 'cover',
    this.imageFile,
  });
}
