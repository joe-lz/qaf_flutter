import 'package:flutter/material.dart';
import 'package:tcard/tcard.dart';

List<Color> colors = [
  Colors.blue,
  Colors.yellow,
  Colors.red,
  Colors.orange,
  Colors.pink,
  Colors.amber,
  Colors.cyan,
  Colors.purple,
  Colors.brown,
  Colors.teal,
];

List<Widget> cards = List.generate(
  colors.length,
  (int index) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: colors[index],
      ),
      child: Text(
        '${index + 1}',
        style: TextStyle(fontSize: 100.0, color: Colors.white),
      ),
    );
  },
);

class CardProfile extends StatefulWidget {
  CardProfile({Key key}) : super(key: key);

  @override
  _CardProfileState createState() => _CardProfileState();
}

class _CardProfileState extends State<CardProfile> {
  TCardController _controller = TCardController();

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TCard(
            cards: cards,
            controller: _controller,
            onForward: (index, info) {
              _index = index;
              print(info.direction);
              setState(() {});
            },
            onBack: (index) {
              _index = index;
              setState(() {});
            },
            onEnd: () {
              print('end');
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              OutlineButton(
                onPressed: () {
                  _controller.back();
                },
                child: Text('Back'),
              ),
              OutlineButton(
                onPressed: () {
                  _controller.forward();
                },
                child: Text('Forward'),
              ),
              OutlineButton(
                onPressed: () {
                  _controller.reset();
                },
                child: Text('Reset'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
