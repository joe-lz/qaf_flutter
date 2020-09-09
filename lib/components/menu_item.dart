import 'package:flutter/material.dart';
import 'package:qaf_flutter/constants.dart';

class MenuItem extends StatefulWidget {
  MenuItem({Key key, this.title = 'title', this.action, this.showIconRight = true, this.showBorderBottom = false}) : super(key: key);
  final String title;
  final Function action;
  final bool showIconRight;
  final bool showBorderBottom;

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
    return Container(
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.all(Radius.circular(10)),
      //   color: Colors.white,
      // ),
      height: 44,
      width: MediaQuery.of(context).size.width - DefaultPadding * 2,
      child: Material(
        child: InkWell(
          onTap: () {
            if (widget.action != null) {
              widget.action();
            }
          },
          child: Padding(
            padding: EdgeInsets.fromLTRB(DefaultPadding, 0, DefaultPadding / 2, 0),
            child: Row(
              children: [
                Text(
                  widget.title,
                  style: TextStyle(color: kPrimaryColor, fontSize: 16),
                ),
                Expanded(
                  child: Container(
                    child: null,
                  ),
                ),
                widget.showIconRight
                    ? Container(
                        child: Icon(
                          Icons.chevron_right,
                          color: kDisabledColor,
                        ),
                      )
                    : Container(
                        child: null,
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
