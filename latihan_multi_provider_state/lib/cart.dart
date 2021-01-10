import 'package:flutter/foundation.dart';

class Cart with ChangeNotifier {
  int _qty = 0;
  int get qty => _qty;
  void incrementCart() {
    _qty += 1;
    notifyListeners();
  }
}
