import 'package:flutter/material.dart';

class ColorSwapProvider extends ChangeNotifier {
  bool flag = true;
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
/////////////////////////////////////////

  void selectColors(int index) {
    if (flag == true) {
      firstIndex = index;
      flag = false;
    } else {
      secoundIndex = index;
      Color temp = colorList[firstIndex!];
      colorList[firstIndex!] = colorList[secoundIndex!];
      colorList[secoundIndex!] = temp;
      flag = true;
    }
    notifyListeners();
  }
}
