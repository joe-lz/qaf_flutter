import 'package:flutter/material.dart';
import 'package:qaf_flutter/components/navigator.dart';

class PostEditNextScreen extends StatefulWidget {
  PostEditNextScreen({Key key}) : super(key: key);

  @override
  _PostEditNextScreenState createState() => _PostEditNextScreenState();
}

class _PostEditNextScreenState extends State<PostEditNextScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        top: true,
        bottom: true,
        child: Column(
          children: [
            NavigatorItem(),
          ],
        ),
      ),
    );
  }
}
