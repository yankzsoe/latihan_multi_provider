import 'package:flutter/foundation.dart';

class Cart with ChangeNotifier {
  int _qty = 0;
  int get qty => _qty;
  set qty(int val) {
    _qty = val;
    notifyListeners();
  }
}
