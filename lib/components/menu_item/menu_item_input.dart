import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qaf_flutter/components/pick_helper.dart';
import 'package:qaf_flutter/provider/theme_provider/colors.dart';
import 'package:qaf_flutter/provider/theme_provider/dimens.dart';

import 'package:flutter_picker/flutter_picker.dart';

class MenuItemInput extends StatefulWidget {
  MenuItemInput({
    Key key,
    this.title,
    this.desc,
    this.inputType = 'input', // input, picker, actionsheet
    this.pickerType = 'number', // number, simple,
    this.onChanged,
    this.dataActionSheet,
    this.dataPicker,
    this.pickerList,
    this.unit,
  }) : super(key: key);
  final String title;
  final desc;
  final String inputType;
  final String pickerType;
  final Function onChanged;
  final List dataActionSheet;
  final List<NumberPickerColumn> dataPicker;
  final List<String> pickerList;
  final String unit;

  @override
  _MenuItemInputState createState() => _MenuItemInputState();
}

class _MenuItemInputState extends State<MenuItemInput> {
  // @override
  // void initState() {
  //   var data = widget.title;
  //   print(data);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: widget.inputType == 'input' ? Dimens.gap_dp16 / 2 : 0),
      child: Container(
        height: Dimens.menu_height,
        child: widget.inputType == 'input'
            ? TextFormField(
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  filled: true,
                  border: InputBorder.none,
                  hintText: '请输入',
                  contentPadding: const EdgeInsets.all(0.0),
                ),
                textAlign: TextAlign.end,
                autocorrect: false,
                autofocus: false,
                // obscureText: widget.obscureText,
                onChanged: widget.onChanged,
              )
            : GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  if (widget.inputType == 'picker') {
                    if (widget.pickerType == 'number') {
                      PickHelper.openNumberPicker(
                        context,
                        reversedOrder: true,
                        title: '请选择${widget.title}',
                        selecteds: [50],
                        datas: widget.dataPicker,
                        onConfirm: (Picker picker, List value) {
                          // print(value.toString());
                          // print(picker.getSelectedValues());
                          widget.onChanged(picker.getSelectedValues()[0]);
                        },
                      );
                    } else if (widget.pickerType == 'simple') {
                      // PickHelper.openSimpleDataPicker(
                      //   context,
                      //   title: '请选择${widget.title}',
                      //   list: widget.dataPicker,
                      //   value: '',
                      //   onConfirm: (Picker picker, List value) {
                      //     // print(value.toString());
                      //     // print(picker.getSelectedValues());
                      //     widget.onChanged(picker.getSelectedValues()[0]);
                      //   },
                      // );
                    }
                  } else {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return CupertinoActionSheet(
                          // title: Text('提示'),
                          message: Text('请选择${widget.title}'),
                          actions: widget.dataActionSheet
                              .map(
                                (item, {index}) => CupertinoActionSheetAction(
                                  child: Text(item),
                                  onPressed: () async {
                                    widget.onChanged(item);
                                    Navigator.pop(context, 'Cancel');
                                  },
                                ),
                              )
                              .toList(),
                          cancelButton: CupertinoActionSheetAction(
                            child: Text('取消'),
                            isDestructiveAction: true,
                            // isDefaultAction: true,
                            onPressed: () {
                              Navigator.pop(context, 'Cancel');
                            },
                          ),
                        );
                      },
                    );
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(widget.desc != null ? '${widget.desc}' : ''),
                    Text(widget.unit != null && widget.desc != null ? '${widget.unit}' : ''),
                    Icon(
                      Icons.chevron_right,
                      color: Colours().getColor().icon_color,
                      size: 20,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
