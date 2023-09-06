/// Special thanks to my very special someone who pushed and convinced me to join the Studev's Challenge, Leslie G. Martinez
///Copyright 2021-2023

import 'package:flutter/material.dart';

class ResultProvider extends ChangeNotifier {
  List<String> _result = ['0', ''];

  List<String> get result => _result;

  void updateResult(List<String> newResult) {
    _result = newResult;

    notifyListeners();
  }
}
