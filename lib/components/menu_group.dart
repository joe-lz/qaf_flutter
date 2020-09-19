import 'package:flutter/material.dart';
import 'package:qaf_flutter/provider/theme/dimens.dart';

class MenuGroup extends StatefulWidget {
  MenuGroup({
    Key key,
    this.children,
    this.title,
    this.desc,
  }) : super(key: key);
  final List<Widget> children;
  final String title;
  final String desc;

  @override
  _MenuGroupState createState() => _MenuGroupState();
}

class _MenuGroupState extends State<MenuGroup> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(Dimens.font_sp16, Dimens.font_sp16 / 2, Dimens.font_sp16, Dimens.font_sp16 / 2),
      child: Column(
        children: [
          widget.title != null
              ? Padding(
                  padding: EdgeInsets.only(bottom: Dimens.font_sp16 / 2),
                  child: Row(
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: null,
                        ),
                      )
                    ],
                  ),
                )
              : Container(child: null),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(Dimens.radius_10)),
            child: Column(
              children: widget.children,
            ),
          ),
          widget.desc != null
              ? Padding(
                  padding: EdgeInsets.fromLTRB(Dimens.font_sp16, Dimens.font_sp16 / 2, Dimens.font_sp16, 0),
                  child: Row(
                    children: [
                      Text(
                        widget.desc,
                        style: TextStyle(
                          color: Theme.of(context).textTheme.caption.color,
                          fontSize: 12,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: null,
                        ),
                      )
                    ],
                  ),
                )
              : Container(child: null),
        ],
      ),
    );
  }
}
