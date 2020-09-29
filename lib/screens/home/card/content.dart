import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';

import 'package:qaf_flutter/provider/global.dart';
import 'package:qaf_flutter/provider/counter.dart';
import 'package:qaf_flutter/provider/theme/dimens.dart';
import 'package:qaf_flutter/utils/screen_utils.dart';

class CardContentComponent extends StatefulWidget {
  CardContentComponent({Key key}) : super(key: key);

  @override
  _CardContentComponentState createState() => _CardContentComponentState();
}

class _CardContentComponentState extends State<CardContentComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onPanDown: (DragDownDetails downDetails) {
          context.read<GlobalModal>().updateDisableHomeSwipe(false);
        },
        child: Container(
          color: Colors.blue[100],
          child: Column(
            children: [
              Text('${context.watch<GlobalModal>().disableHomeSwipe}'),
              Container(
                width: ScreenUtils.screenW(context) - Dimens.gap_dp16 * 2,
                // color: Colors.red,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onPanDown: (DragDownDetails downDetails) {
                    context.read<GlobalModal>().updateDisableHomeSwipe(true);
                  },
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return Image.network(
                        "http://via.placeholder.com/288x188",
                        fit: BoxFit.fill,
                      );
                    },
                    itemCount: 10,
                    itemWidth: 300.0,
                    itemHeight: 400.0,
                    layout: SwiperLayout.TINDER,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
