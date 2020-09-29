import 'package:flutter/material.dart';
import 'package:qaf_flutter/screens/home/nearby/map.dart';

class NearbyComponent extends StatefulWidget {
  NearbyComponent({Key key}) : super(key: key);

  @override
  NearbyComponentState createState() => NearbyComponentState();
}

class NearbyComponentState extends State<NearbyComponent> {
  @override
  Widget build(BuildContext context) {
    return MapComponent();
  }
}
