import 'package:flutter/foundation.dart';

class Balance with ChangeNotifier {
  int _money = 10000;
  int get money => _money;
  void decrementBalance() {
    _money -= 500;
    notifyListeners();
  }
}
