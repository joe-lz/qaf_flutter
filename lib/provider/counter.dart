import 'package:flutter/material.dart';

class CounterModal with ChangeNotifier {
  int _count = 0;
  // CounterModal(this._count);

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
