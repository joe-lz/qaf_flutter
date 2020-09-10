import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qaf_flutter/components/card_login.dart';
import 'package:qaf_flutter/components/card_register.dart';
import 'package:qaf_flutter/constants.dart';
import 'package:flip_card/flip_card.dart';

class ModalLogin extends StatefulWidget {
  ModalLogin({Key key}) : super(key: key);

  @override
  _ModalLoginState createState() => _ModalLoginState();
}

class _ModalLoginState extends State<ModalLogin> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: Column(
            children: [
              // TitlePage(title: '登录'),
              Expanded(
                child: Container(
                  child: null,
                ),
              ),
              FlipCard(
                key: cardKey,
                flipOnTouch: false,
                direction: FlipDirection.HORIZONTAL, // default
                front: CardLogin(cardKey: cardKey),
                back: CardRegister(cardKey: cardKey),
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
