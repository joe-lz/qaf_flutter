import 'package:flutter/material.dart';
import 'package:qaf_flutter/constants.dart';

class MeLoginScreen extends StatefulWidget {
  @override
  _MeLoginScreenState createState() => _MeLoginScreenState();
}

class _MeLoginScreenState extends State<MeLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: SafeArea(
        top: true,
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}

class MenuSingle {}
