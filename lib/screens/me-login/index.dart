import 'package:flutter/material.dart';

class MeLoginScreen extends StatefulWidget {
  @override
  _MeLoginScreenState createState() => _MeLoginScreenState();
}

class _MeLoginScreenState extends State<MeLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
