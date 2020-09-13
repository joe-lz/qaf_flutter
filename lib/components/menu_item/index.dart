import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:qaf_flutter/components/menu_item/menu_item_display.dart';
import 'package:qaf_flutter/components/menu_item/menu_item_input.dart';
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
    // input
    this.editMode = false,
    this.inputType = 'input', // input, picker, actionsheet
    this.onChanged,
    this.dataActionSheet,
    this.dataPicker,
    this.unit,
  }) : super(key: key);
  final String title;
  final desc;
  final String descHint;
  final Function action;
  final bool showIconRight;
  final bool showBorderBottom;
  final String type;
  final Color colorTitle;
  final Color colorDesc;
  final Color colorDescHint;
  // input
  final bool editMode;
  final String inputType;
  final Function onChanged;
  final List dataActionSheet;
  final List<NumberPickerColumn> dataPicker;
  final String unit;

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
                child: FractionallySizedBox(
                  heightFactor: 1,
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
                      // Expanded(
                      //   child: Container(
                      //     child: null,
                      //   ),
                      // ),
                      Expanded(
                        child: Container(
                          // color: Colors.red,
                          child: widget.editMode
                              ? MenuItemInput(
                                  title: widget.title,
                                  desc: widget.desc,
                                  inputType: widget.inputType,
                                  onChanged: widget.onChanged,
                                  dataActionSheet: widget.dataActionSheet,
                                  dataPicker: widget.dataPicker,
                                  unit: widget.unit,
                                )
                              : MenuItemDisplay(
                                  desc: widget.desc,
                                  descHint: widget.descHint,
                                  showIconRight: widget.showIconRight,
                                  colorDesc: widget.colorDesc,
                                  colorDescHint: widget.colorDescHint,
                                  unit: widget.unit,
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
