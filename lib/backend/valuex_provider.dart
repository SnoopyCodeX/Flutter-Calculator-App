import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ValueXProvider extends ChangeNotifier {
  bool _hasValueX = true;

  bool get hasValueX => _hasValueX;

  void updateX(bool hasValueX) {
    _hasValueX = hasValueX;
    notifyListeners();
  }
}
