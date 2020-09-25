import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:qaf_flutter/provider/counter.dart';
import 'package:qaf_flutter/provider/user.dart';

class PostComponent extends StatefulWidget {
  PostComponent({Key key}) : super(key: key);

  @override
  _PostComponentState createState() => _PostComponentState();
}

class _PostComponentState extends State<PostComponent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text('data'),
          // Text('${context.watch<CounterModal>().count}'),
          Text('${context.watch<CounterModal>().count}'),
          Text('appName').tr(),
          FloatingActionButton(
            /// Calls `context.read` instead of `context.watch` so that it does not rebuild
            /// when [Counter] changes.
            onPressed: () => context.read<CounterModal>().increment(),
            tooltip: 'Increment',
            child: const Icon(Icons.message),
          )
        ],
      ),
    );
  }
}
