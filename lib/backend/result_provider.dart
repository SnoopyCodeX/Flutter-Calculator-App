import 'package:flutter/material.dart';

class ResultProvider extends ChangeNotifier {
  List<String> _result = ['0', ''];

  List<String> get result => _result;

  void updateResult(List<String> newResult) {
    _result = newResult;

    notifyListeners();
  }
}
