import 'package:flutter/material.dart';
import 'package:qaf_flutter/constants.dart';
import 'package:qaf_flutter/utils/screen_utils.dart';

class MenuItemInput extends StatefulWidget {
  MenuItemInput({
    Key key,
    this.desc,
  }) : super(key: key);
  final String desc;

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
    return Container(
      width: 200,
      height: MenuHeight,
      child: TextFormField(
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
        onChanged: (text) {},
        // onChanged: widget.onChanged,
      ),
    );
  }
}
