import 'package:flutter/material.dart';
import 'package:qaf_flutter/components/menu_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
