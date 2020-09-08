import 'package:flutter/material.dart';
import 'package:qaf_flutter/components/menu_item.dart';

class MeScreen extends StatefulWidget {
  @override
  _MeScreenState createState() => _MeScreenState();
}

class _MeScreenState extends State<MeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        top: true,
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [MenuItem()],
          ),
        ),
      ),
    );
  }
}
