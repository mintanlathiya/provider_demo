import 'package:flutter/material.dart';

class IncrementDecrementProvider extends ChangeNotifier {
  int count = 0;
  int doubleCount = 0;

  void increment() {
    count++;
    print(count);
    notifyListeners();
  }

  void decrement() {
    count--;
    print(count);
    notifyListeners();
  }

  void increment2() {
    doubleCount += 2;
    print(doubleCount);
    notifyListeners();
  }

  void decrement2() {
    doubleCount -= 2;
    print(doubleCount);
    notifyListeners();
  }
}
