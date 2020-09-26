import 'package:flutter/material.dart';
import 'package:qaf_flutter/utils/screen_utils.dart';

class HomeDetailScreen extends StatefulWidget {
  @override
  _HomeDetailScreenState createState() => _HomeDetailScreenState();
}

class _HomeDetailScreenState extends State<HomeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            width: ScreenUtils.screenW(context),
            height: 300,
            child: Image.network(
              'https://images.pexels.com/photos/4887433/pexels-photo-4887433.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
