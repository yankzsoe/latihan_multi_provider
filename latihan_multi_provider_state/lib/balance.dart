import 'package:flutter/foundation.dart';

class Balance with ChangeNotifier {
  int _money = 10000;
  int get money => _money;
  set money(int val) {
    _money = val;
    notifyListeners();
  }
}
