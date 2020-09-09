import 'package:flutter/material.dart';
import 'package:qaf_flutter/constants.dart';

class InputItem extends StatefulWidget {
  InputItem({Key key, this.labelText = 'labelText', this.hintText = 'hintText', this.prefixIcon, this.obscureText = false}) : super(key: key);
  final String labelText;
  final String hintText;
  final Widget prefixIcon;
  final bool obscureText;

  @override
  _InputItemState createState() => _InputItemState();
}

class _InputItemState extends State<InputItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, DefaultPadding / 2, 0, DefaultPadding / 2),
      child: Container(
        child: TextField(
          decoration: InputDecoration(
            labelText: widget.labelText,
            hintText: widget.hintText,
            // prefixIcon: widget.prefixIcon
            // 未获得焦点下划线设为灰色
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kBorderColor),
            ),
            //获得焦点下划线设为蓝色
            // focusedBorder: UnderlineInputBorder(
            //   borderSide: BorderSide(color: Colors.blue),
            // ),
          ),
          autocorrect: false,
          autofocus: false,
          obscureText: widget.obscureText,
          keyboardType: TextInputType.emailAddress,
        ),
      ),
    );
  }
}
