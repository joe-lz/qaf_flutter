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
          ),
          autofocus: false,
          obscureText: widget.obscureText,
        ),
      ),
    );
  }
}
