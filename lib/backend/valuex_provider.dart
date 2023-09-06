/// Special thanks to my very special someone who pushed and convinced me to join the Studev's Challenge, Leslie G. Martinez
///Copyright 2021-2023

import 'package:flutter/material.dart';

class ValueXProvider extends ChangeNotifier {
  bool _hasValueX = true;

  bool get hasValueX => _hasValueX;

  void updateX(bool hasValueX) {
    _hasValueX = hasValueX;
    notifyListeners();
  }
}
