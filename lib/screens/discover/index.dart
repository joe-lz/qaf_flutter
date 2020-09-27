import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:qaf_flutter/provider/counter.dart';
import 'package:qaf_flutter/provider/user.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserModal>().getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Container(
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
    );
  }
}
