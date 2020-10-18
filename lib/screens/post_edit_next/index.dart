import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';

import 'package:qaf_flutter/provider/post.dart';
import 'package:qaf_flutter/components/navigator.dart';
import 'package:qaf_flutter/provider/theme/dimens.dart';
import 'package:qaf_flutter/utils/screen_utils.dart';

class PostEditNextScreen extends StatefulWidget {
  PostEditNextScreen({
    Key key,
    this.data,
  }) : super(key: key);
  final List data;

  @override
  _PostEditNextScreenState createState() => _PostEditNextScreenState();
}

class _PostEditNextScreenState extends State<PostEditNextScreen> {
  @override
  void initState() {
    super.initState();
  }

  handleSubmit() async {
    final imagelistLocal = widget.data;

    List<Map> imagelistRemote = [];
    for (var i = 0; i < imagelistLocal.length; i++) {
      if (i != imagelistLocal.length - 1) {
        // print(imagelistLocal[i].imageFile);
        final uploadResult = await handleUploadSingle(imagelistLocal[i].imageFile);
        imagelistRemote.add({
          'mode': imagelistLocal[i].mode,
          'imgUrl': uploadResult['url'],
          'leanId': uploadResult.objectId,
          'key': uploadResult['key'],
        });
      }
    }
    // 创建post
    await context.read<PostModal>().createMyPost(imagelistRemote);
  }

  Future handleUploadSingle(File file) async {
    final dir = await path_provider.getTemporaryDirectory();
    final targetPath = dir.absolute.path + "/temp.jpg";
    final compressFile = await compressAndGetFile(file, targetPath);
    // upload
    LCFile uploadedFile = await LCFile.fromPath('resume.txt', compressFile.path);
    await uploadedFile.save();
    return uploadedFile;
  }

  // 2. compress file and get file. 压缩
  Future<File> compressAndGetFile(File file, String targetPath) async {
    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: 90,
      minWidth: 1000,
      minHeight: 1000,
    );
    // print(file.lengthSync());
    // print(result.lengthSync());
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final imagelistLocal = widget.data;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: SafeArea(
          top: true,
          bottom: true,
          child: Column(
            children: [
              NavigatorItem(),
              Padding(
                // padding: EdgeInsets.fromLTRB(0, DefaultPadding / 2, 0, DefaultPadding / 2),
                padding: EdgeInsets.fromLTRB(Dimens.gap_dp16, 0, Dimens.gap_dp16, 0),
                child: Container(
                  height: 120,
                  // color: Theme.of(context).canvasColor,
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyText1.fontSize,
                      color: Colors.black,
                    ),
                    // keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    maxLines: null,
                    decoration: InputDecoration(
                      // fillColor: Theme.of(context).scaffoldBackgroundColor,
                      // filled: true,
                      // border: InputBorder.none,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      hintText: '输入你这一刻最想说的话...',
                      isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(Dimens.gap_dp16 / 2, Dimens.gap_dp16 / 3, Dimens.gap_dp16 / 2, Dimens.gap_dp16 / 3),
                    ),
                    textAlign: TextAlign.start,
                    autocorrect: false,
                    autofocus: true,
                    // obscureText: widget.obscureText,
                    // onChanged: widget.onChanged,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 500,
                  child: Padding(
                    padding: EdgeInsets.all(Dimens.gap_dp16),
                    child: GridView.count(
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      crossAxisCount: 4,
                      children: List.generate(
                        imagelistLocal.length - 1,
                        (index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(Dimens.radius_10 / 2)),
                            child: Container(
                              decoration: BoxDecoration(
                                // border: Border.all(width: 0.5, color: Theme.of(context).textTheme.caption.color),
                                color: Theme.of(context).canvasColor,
                              ),
                              child: Image.file(
                                imagelistLocal[index].imageFile,
                                fit: imagelistLocal[index].mode == 'contain' ? BoxFit.contain : BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
