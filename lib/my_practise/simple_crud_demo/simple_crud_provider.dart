import 'package:flutter/material.dart';

class SimpleCrudProvider extends ChangeNotifier {
  bool isCricket = false, isFootball = false, isSinging = false;
  String gender = 'gender', male = 'male', feMale = 'feMale';
  List<String> stream = ['arts', 'commerce', 'science'];
  String? selectedStream;
  bool isActive = false;
  double selectedSalary = 1000;
  TextEditingController txtFirstNameEditingController = TextEditingController();
  TextEditingController txtMiddleEditingController = TextEditingController();
  TextEditingController txtLastNameEditingController = TextEditingController();
  TextEditingController txtUpdateFirstNameEditingController =
      TextEditingController();
  TextEditingController txtUpdateMiddleEditingController =
      TextEditingController();
  TextEditingController txtUpdateLastNameEditingController =
      TextEditingController();
  List<Map<String, dynamic>> userData = [];
  int selectedIndex = 0;
  List<String> hobbyList = [];
  bool isSubmited = false;

  void checkGender(String value) {
    isSubmited = false;
    gender = value;
    notifyListeners();
  }

  void showData() {
    isSubmited = true;
    notifyListeners();
  }

  void cricketMethod(bool value) {
    isSubmited = false;
    isCricket = value;
    isCricket == true ? hobbyList.add('Cricket') : hobbyList.remove('Cricket');
    notifyListeners();
  }

  void footballMethod(bool value) {
    isSubmited = false;
    isFootball = value;
    isFootball == true
        ? hobbyList.add('Football')
        : hobbyList.remove('Football');
    notifyListeners();
  }

  void singingMethod(bool value) {
    isSubmited = false;
    isSinging = value;
    isSinging == true ? hobbyList.add('Singing') : hobbyList.remove('Singing');
    notifyListeners();
  }

  void streamMethod(String value) {
    selectedStream = value;

    notifyListeners();
  }

  void switchMethod(bool value) {
    isSubmited = false;
    isActive = value;

    notifyListeners();
  }

  void sliderMethod(double value) {
    isSubmited = false;
    selectedSalary = value;

    notifyListeners();
  }

  void addUserData() {
    userData.add({
      'name': txtFirstNameEditingController.text,
      'middle': txtMiddleEditingController.text,
      'lastName': txtLastNameEditingController.text,
      'salary': selectedSalary,
      'gender': gender,
      'hobby': List.from(hobbyList.map((e) => e)),
      'stream': selectedStream,
      'active': isActive,
    });
  }

  void clearMethod() {
    txtFirstNameEditingController.clear();
    txtMiddleEditingController.clear();
    txtLastNameEditingController.clear();
    selectedSalary = 1000;
    gender = 'gender';
    hobbyList.clear();
    isCricket = false;
    isFootball = false;
    isSinging = false;
    isActive = false;
    selectedStream = null;
  }

  void clearUpdateMethod() {
    txtUpdateFirstNameEditingController.clear();
    txtUpdateMiddleEditingController.clear();
    txtLastNameEditingController.clear();
    selectedSalary = 1000;
    gender = 'gender';
    hobbyList.clear();
    isCricket = false;
    isFootball = false;
    isSinging = false;
    isActive = false;
    selectedStream = null;
  }

  void onTapList(int selectedIndex) {
    txtUpdateFirstNameEditingController.text = userData[selectedIndex]['name'];
    txtUpdateMiddleEditingController.text = userData[selectedIndex]['middle'];
    txtUpdateLastNameEditingController.text =
        userData[selectedIndex]['lastName'];
    selectedSalary = userData[selectedIndex]['salary'];
    gender = userData[selectedIndex]['gender'];
    hobbyList = userData[selectedIndex]['hobby'].map((e) => e).toList();
    if (userData[selectedIndex]['hobby'].contains('Cricket')) {
      isCricket = true;
    }
    if (userData[selectedIndex]['hobby'].contains('Football')) {
      isFootball = true;
    }
    if (userData[selectedIndex]['hobby'].contains('Singing')) {
      isSinging = true;
    }
    selectedStream = userData[selectedIndex]['stream'];
    isActive = userData[selectedIndex]['active'];
  }

  void updateMethod() {
    userData[selectedIndex]['name'] = txtUpdateFirstNameEditingController.text;
    userData[selectedIndex]['middle'] = txtUpdateMiddleEditingController.text;
    userData[selectedIndex]['lastName'] =
        txtUpdateLastNameEditingController.text;
    userData[selectedIndex]['salary'] = selectedSalary;
    userData[selectedIndex]['gender'] = gender;
    userData[selectedIndex]['hobby'] = List.from(hobbyList.map((e) => e));
    userData[selectedIndex]['stream'] = selectedStream;
    userData[selectedIndex]['active'] = isActive;
  }

  void updateButton(dynamic context) {
    Navigator.pop(context);

    notifyListeners();
  }

  void cancleButton(dynamic context) {
    Navigator.pop(context);

    notifyListeners();
  }

  void deleteButton(dynamic context, index) {
    userData.removeAt(index);
    Navigator.pop(context);

    notifyListeners();
  }

  void cancleDeleteButton(dynamic context) {
    Navigator.pop(context);

    notifyListeners();
  }
}
