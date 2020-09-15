import 'package:flutter/material.dart';
import 'package:qaf_flutter/components/menu_item/index.dart';
import 'package:qaf_flutter/provider/theme_provider/dimens.dart';

class MenuOne extends StatefulWidget {
  MenuOne({
    Key key,
    this.title = 'title',
    this.desc,
    this.descHint,
    this.action,
    this.showIconRight = false,
    this.showBorderBottom = false,
    this.type = 'normal', // normal, active, disabled
    this.colorTitle,
    this.colorDesc,
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
  final bool editMode;

  @override
  _MenuOneState createState() => _MenuOneState();
}

class _MenuOneState extends State<MenuOne> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(Dimens.gap_dp16, Dimens.gap_dp16 / 2, Dimens.gap_dp16, Dimens.gap_dp16 / 2),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(Dimens.radius_10)),
        child: MenuItem(
          title: widget.title,
          desc: widget.desc,
          descHint: widget.descHint,
          action: widget.action,
          showIconRight: widget.showIconRight,
          showBorderBottom: widget.showBorderBottom,
          type: widget.type,
          colorTitle: widget.colorTitle,
          editMode: widget.editMode,
        ),
      ),
    );
  }
}
