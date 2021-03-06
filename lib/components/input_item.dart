import 'package:flutter/material.dart';

class InputItem extends StatefulWidget {
  InputItem({
    Key key,
    this.labelText,
    this.hintText = 'hintText',
    this.prefixIcon,
    this.obscureText = false,
    this.onChanged,
    this.validator,
  }) : super(key: key);
  final String labelText;
  final String hintText;
  final Widget prefixIcon;
  final bool obscureText;
  final Function onChanged;
  final Function validator;

  @override
  _InputItemState createState() => _InputItemState();
}

class _InputItemState extends State<InputItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: EdgeInsets.fromLTRB(0, DefaultPadding / 2, 0, DefaultPadding / 2),
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Container(
        height: 80,
        child: TextFormField(
          decoration: InputDecoration(
            counterText: ' ',
            labelText: widget.labelText,
            hintText: widget.hintText,
            // prefixIcon: widget.prefixIcon
            // 未获得焦点下划线设为灰色
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).dividerTheme.color),
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
          onChanged: widget.onChanged,
          validator: widget.validator,
        ),
      ),
    );
  }
}
