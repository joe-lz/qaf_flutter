import 'package:flutter/material.dart';
import 'package:qaf_flutter/utils/screen_utils.dart';

class PostAddComponent extends StatefulWidget {
  PostAddComponent({
    Key key,
    this.handleAdd,
  }) : super(key: key);
  final handleAdd;

  @override
  _PostAddComponentState createState() => _PostAddComponentState();
}

class _PostAddComponentState extends State<PostAddComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: ScreenUtils.screenW(context) * 0.85,
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              boxShadow: [
                // BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 5, blurRadius: 5, offset: Offset(0, 0))
              ],
              border: Border(bottom: BorderSide(width: 0.5, color: Theme.of(context).dividerTheme.color)),
            ),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => widget.handleAdd(),
              child: ConstrainedBox(
                constraints: const BoxConstraints.expand(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      size: 30,
                      color: Theme.of(context).textTheme.caption.color,
                    ),
                    Text(
                      '添加图片',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.caption.color,
                        fontSize: Theme.of(context).textTheme.bodyText1.fontSize,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
