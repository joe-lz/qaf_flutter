import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qaf_flutter/components/card_login.dart';
import 'package:qaf_flutter/components/card_register.dart';
import 'package:flip_card/flip_card.dart';

class ModalLogin extends StatefulWidget {
  ModalLogin({Key key}) : super(key: key);

  @override
  _ModalLoginState createState() => _ModalLoginState();
}

class _ModalLoginState extends State<ModalLogin> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  var leanerr;

  @override
  void initState() {
    super.initState();
    loadAsset();
  }

  loadAsset() async {
    final res = await rootBundle.loadString('lib/utils/leanerr.json');
    Map<String, dynamic> resJSON = jsonDecode(res);
    setState(() {
      leanerr = resJSON;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: null,
                ),
              ),
              FlipCard(
                key: cardKey,
                flipOnTouch: false,
                direction: FlipDirection.HORIZONTAL, // default
                front: CardLogin(
                  cardKey: cardKey,
                  leanerr: leanerr,
                ),
                back: CardRegister(
                  cardKey: cardKey,
                  leanerr: leanerr,
                ),
              ),
              // Container(
              //   height: DefaultPadding,
              //   child: null,
              // ),
              Expanded(
                child: Container(
                  child: null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
