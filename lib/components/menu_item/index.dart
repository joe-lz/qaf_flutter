import 'package:flutter/material.dart';
import 'package:qaf_flutter/constants.dart';
import 'package:qaf_flutter/utils/screen_utils.dart';

class MenuItem extends StatefulWidget {
  MenuItem({
    Key key,
    this.title = 'title',
    this.desc,
    this.descHint,
    this.action,
    this.showIconRight = false,
    this.showBorderBottom = false,
    this.type = 'normal', // normal, active, disabled
    this.colorTitle = kTextColor,
    this.colorDesc = kTextColor,
    this.colorDescHint = kDisabledColor,
    this.editMode = false,
  }) : super(key: key);
  final String title;
  final String desc;
  final String descHint;
  final Function action;
  final bool showIconRight;
  final bool showBorderBottom;
  final String type;
  final Color colorTitle;
  final Color colorDesc;
  final Color colorDescHint;
  final bool editMode;

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  // @override
  // void initState() {
  //   var data = widget.title;
  //   print(data);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Material(
      // color: widget.type == 'disabled' ? kBorderColor : Colors.white,
      color: Colors.white,
      child: InkWell(
        onTap: widget.action,
        child: Container(
          height: MenuHeight,
          width: ScreenUtils.screenW(context) - DefaultPadding * 2,
          child: Stack(
            children: [
              Positioned(
                left: DefaultPadding,
                top: MenuHeight - 1,
                child: Container(
                  width: ScreenUtils.screenW(context) - DefaultPadding * 2,
                  height: widget.showBorderBottom ? 0.5 : 0,
                  color: kBorderColor,
                  child: null,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(DefaultPadding, 0, DefaultPadding / 2, 0),
                child: Row(
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        color: widget.colorTitle,
                        fontSize: kFontSizeNormal,
                        // fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: null,
                      ),
                    ),
                    widget.desc != null
                        ? Padding(
                            padding: EdgeInsets.only(right: widget.showIconRight ? 0 : DefaultPadding / 2),
                            child: Container(
                              child: Text(
                                widget.desc,
                                style: TextStyle(
                                  color: widget.colorDesc,
                                ),
                              ),
                            ),
                          )
                        : Container(
                            child: widget.descHint != null
                                ? Padding(
                                    padding: EdgeInsets.only(right: widget.showIconRight ? 0 : DefaultPadding / 2),
                                    child: Container(
                                      child: Text(
                                        widget.descHint,
                                        style: TextStyle(
                                          color: widget.colorDescHint,
                                        ),
                                      ),
                                    ),
                                  )
                                : Text(''),
                          ),
                    widget.showIconRight
                        ? Container(
                            child: Icon(
                              Icons.chevron_right,
                              color: kDisabledColor,
                              size: 20,
                            ),
                          )
                        : Container(
                            child: null,
                          )
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
