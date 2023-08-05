import 'package:flutter/material.dart';

class ColorSwapProvider extends ChangeNotifier {
  List<Color> colorList = [
    Colors.red,
    Colors.yellow,
    Colors.black,
    Colors.blue,
    Colors.brown,
    Colors.purple,
    Colors.green,
    Colors.teal,
    Colors.grey
  ];
  int? firstIndex, secoundIndex;
  bool click = true;

  void colorController(int index) {
    if (firstIndex == null) {
      firstIndex = index;
      print(firstIndex);
    } else {
      secoundIndex = index;
      print(secoundIndex);
    }
    if (firstIndex != null && secoundIndex != null) {
      Color temp = colorList[firstIndex!];
      colorList[firstIndex!] = colorList[secoundIndex!];
      colorList[secoundIndex!] = temp;
      firstIndex = null;
      secoundIndex = null;
    }
    notifyListeners();
  }
}
