import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:qaf_flutter/provider/counter.dart';
import 'package:qaf_flutter/provider/theme/dimens.dart';
import 'package:qaf_flutter/provider/user.dart';
import 'package:qaf_flutter/screens/home/posts/item.dart';
import 'package:qaf_flutter/components/menu_one.dart';
import 'package:qaf_flutter/components/modal_login.dart';
import 'package:qaf_flutter/provider/post.dart';

class PostComponent extends StatefulWidget {
  PostComponent({Key key}) : super(key: key);

  @override
  _PostComponentState createState() => _PostComponentState();
}

class _PostComponentState extends State<PostComponent> {
  List items = [
    // 'https://images.pexels.com/photos/5103656/pexels-photo-5103656.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
    // 'https://images.pexels.com/photos/927437/pexels-photo-927437.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
    // 'https://images.pexels.com/photos/5156010/pexels-photo-5156010.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
    // 'https://images.pexels.com/photos/4392858/pexels-photo-4392858.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
    // 'https://images.pexels.com/photos/4724068/pexels-photo-4724068.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
    // 'https://images.pexels.com/photos/4887433/pexels-photo-4887433.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
  ];
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    getList();
  }

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    items.add((items.length + 1).toString());
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  getList() async {
    await context.read<PostModal>().getPostList();
  }

  @override
  Widget build(BuildContext context) {
    List<LCObject> itemlist = context.watch<PostModal>().postlist;
    print(itemlist.length);

    return Column(
      children: [
        SafeArea(
          top: true,
          bottom: false,
          child: Column(
            children: [
              Container(height: Dimens.nav_height, child: null),
            ],
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: SmartRefresher(
              enablePullDown: true,
              enablePullUp: true,
              header: ClassicHeader(),
              footer: CustomFooter(
                builder: (BuildContext context, LoadStatus mode) {
                  Widget body;
                  if (mode == LoadStatus.idle) {
                    body = Text("上拉加载");
                  } else if (mode == LoadStatus.loading) {
                    body = CupertinoActivityIndicator();
                  } else if (mode == LoadStatus.failed) {
                    body = Text("加载失败！点击重试！");
                  } else if (mode == LoadStatus.canLoading) {
                    body = Text("松手,加载更多!");
                  } else {
                    body = Text("没有更多数据了!");
                  }
                  return Container(
                    height: 55.0,
                    child: Center(child: body),
                  );
                },
              ),
              controller: _refreshController,
              onRefresh: _onRefresh,
              onLoading: _onLoading,
              child: ListView.builder(
                itemCount: itemlist.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  // if (index == 0) {
                  //   return Column(
                  //     children: <Widget>[
                  //       // MenuOne(
                  //       //   showIconRight: true,
                  //       //   // type: 'active',
                  //       //   // title: 'actions.login'.tr(),
                  //       //   title: '发现你喜欢的圈子',
                  //       //   // colorTitle: Theme.of(context).primaryColor,
                  //       //   action: () {},
                  //       // ),
                  //       PostItemComponent(imageUrl: items[index]),
                  //     ],
                  //   );
                  // } else {
                  // }
                  return PostItemComponent(item: itemlist[index]);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
