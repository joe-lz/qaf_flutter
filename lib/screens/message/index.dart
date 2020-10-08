import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:provider/provider.dart';
import 'package:qaf_flutter/provider/counter.dart';
import 'package:qaf_flutter/provider/user.dart';

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserModal>().getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          // leading: CupertinoButton(
          //   padding: EdgeInsets.all(0),
          //   child: Text(
          //     'actions.cancel'.tr(),
          //     style: TextStyle(
          //       fontSize: Theme.of(context).textTheme.bodyText1.fontSize,
          //       color: Theme.of(context).primaryColor,
          //     ),
          //   ),
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //   },
          // ),
          leading: Container(),
          middle: Text(
            'me_menus.messages'.tr(),
            style: Theme.of(context).textTheme.bodyText1,
          ),
          trailing: CupertinoButton(
            padding: EdgeInsets.all(0),
            child: Text(
              'actions.cancel'.tr(),
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodyText1.fontSize,
                color: Theme.of(context).primaryColor,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: Theme.of(context).canvasColor,
        ),
        child: Container(
          // color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            children: [
              Text('message'),
              FloatingActionButton(
                /// Calls `context.read` instead of `context.watch` so that it does not rebuild
                /// when [Counter] changes.
                onPressed: () => context.read<CounterModal>().increment(),
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
