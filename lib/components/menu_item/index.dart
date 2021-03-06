import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';

import 'package:qaf_flutter/components/menu_item/menu_item_display.dart';
import 'package:qaf_flutter/components/menu_item/menu_item_input.dart';
import 'package:qaf_flutter/provider/theme/dimens.dart';
import 'package:qaf_flutter/utils/screen_utils.dart';

class MenuItem extends StatefulWidget {
  MenuItem({
    Key key,
    this.title = 'title',
    this.titleCenter = false,
    this.desc,
    this.descHint,
    this.action,
    this.showIconRight = false,
    this.showBorderBottom = false,
    this.type = 'normal', // normal, active, disabled
    this.colorTitle,
    this.colorDesc,
    // input
    this.editMode = false,
    this.inputType = 'input', // input, picker, actionsheet
    this.pickerType = 'number', // number, simple, city
    this.onChanged,
    this.dataActionSheet,
    this.dataPicker,
    this.dataPickerSimple,
    this.unit,
  }) : super(key: key);
  final String title;
  final bool titleCenter;
  final dynamic desc; // String, Int
  final String descHint;
  final Function action;
  final bool showIconRight;
  final bool showBorderBottom;
  final String type;
  final Color colorTitle;
  final Color colorDesc;
  // input
  final bool editMode;
  final String inputType;
  final String pickerType;
  final Function onChanged;
  final List dataActionSheet;
  final List<NumberPickerColumn> dataPicker;
  final List<String> dataPickerSimple;
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
      child: InkWell(
        onTap: widget.action,
        child: Container(
          height: Dimens.menu_height,
          width: ScreenUtils.screenW(context) - Dimens.gap_dp16 * 2,
          child: Stack(
            children: [
              Positioned(
                left: Dimens.gap_dp16,
                top: Dimens.menu_height - 1,
                child: Container(
                  width: ScreenUtils.screenW(context) - Dimens.gap_dp16 * 2,
                  height: widget.showBorderBottom ? 0.5 : 0,
                  child: null,
                  color: Theme.of(context).dividerTheme.color,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(Dimens.gap_dp16, 0, Dimens.gap_dp16 / 2, 0),
                child: FractionallySizedBox(
                  heightFactor: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          color: widget.colorTitle != null ? widget.colorTitle : Theme.of(context).textTheme.subtitle1.color,
                          fontSize: Theme.of(context).textTheme.subtitle1.fontSize,
                        ),
                      ),
                      widget.titleCenter
                          ? Container(child: null)
                          : Expanded(
                              child: Container(
                                child: widget.editMode
                                    ? MenuItemInput(
                                        title: widget.title,
                                        desc: widget.desc,
                                        inputType: widget.inputType,
                                        pickerType: widget.pickerType,
                                        onChanged: widget.onChanged,
                                        dataActionSheet: widget.dataActionSheet,
                                        dataPicker: widget.dataPicker,
                                        dataPickerSimple: widget.dataPickerSimple,
                                        unit: widget.unit,
                                      )
                                    : MenuItemDisplay(
                                        desc: widget.desc,
                                        descHint: widget.descHint,
                                        showIconRight: widget.showIconRight,
                                        colorDesc: widget.colorDesc != null ? widget.colorDesc : Theme.of(context).textTheme.subtitle1.color,
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
