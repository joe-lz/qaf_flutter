import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaf_flutter/provider/user.dart';
import 'package:qaf_flutter/provider/counter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   context.read<UserModal>().getCurrentUser();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        top: true,
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('data'),
              // Text('${context.watch<CounterModal>().count}'),
              Text('${context.watch<CounterModal>().count}'),
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
