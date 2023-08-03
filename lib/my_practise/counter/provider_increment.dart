import 'package:flutter/material.dart';

class IncrementDecrementProvider extends ChangeNotifier {
  int countIncrement = 0;
  int doubleCount = 0;

  void increment() {
    countIncrement++;
    print(countIncrement);
    notifyListeners();
  }

  void decrement() {
    countIncrement--;
    print(doubleCount);
    notifyListeners();
  }

  void increment2() {
    doubleCount += 2;
    print(countIncrement);
    notifyListeners();
  }

  void decrement2() {
    doubleCount -= 2;
    print(doubleCount);
    notifyListeners();
  }
}
