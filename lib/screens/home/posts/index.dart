import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:qaf_flutter/provider/counter.dart';
import 'package:qaf_flutter/provider/user.dart';
import 'package:qaf_flutter/screens/home/posts/item.dart';

class PostComponent extends StatefulWidget {
  PostComponent({Key key}) : super(key: key);

  @override
  _PostComponentState createState() => _PostComponentState();
}

class _PostComponentState extends State<PostComponent> {
  List items = [
    'https://images.pexels.com/photos/5103656/pexels-photo-5103656.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
    'https://images.pexels.com/photos/927437/pexels-photo-927437.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
    'https://images.pexels.com/photos/5156010/pexels-photo-5156010.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
    'https://images.pexels.com/photos/4392858/pexels-photo-4392858.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
    'https://images.pexels.com/photos/4724068/pexels-photo-4724068.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
    'https://images.pexels.com/photos/4887433/pexels-photo-4887433.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: items.map((e) => PostItemComponent(imageUrl: e)).toList(),
        // [
        //   Text('data'),
        //   // Text('${context.watch<CounterModal>().count}'),
        //   Text('${context.watch<CounterModal>().count}'),
        //   Text('appName').tr(),
        //   FloatingActionButton(
        //     /// Calls `context.read` instead of `context.watch` so that it does not rebuild
        //     /// when [Counter] changes.
        //     onPressed: () => context.read<CounterModal>().increment(),
        //     tooltip: 'Increment',
        //     child: const Icon(Icons.message),
        //   ),
        // ],
      ),
    );
  }
}
