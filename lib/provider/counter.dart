import 'package:flutter/material.dart';

class CounterModal with ChangeNotifier {
  //1
  int _count;
  CounterModal(this._count);

  void add() {
    _count++;
    notifyListeners(); //2
  }

  get count => _count; //3
}
