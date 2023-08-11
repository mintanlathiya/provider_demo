import 'package:flutter/material.dart';

class TicTacProvider extends ChangeNotifier {
  int player1 = 0, player2 = 0;
  String zero = 'O', cross = 'X';
  int? selectedIndex;
  bool changeTurn = false;
  int count = 0;
  List<String> gamePlay = ['', '', '', '', '', '', '', '', ''];

  void play(int value) {
    selectedIndex = value;
    if (changeTurn == false) {
      if (gamePlay[selectedIndex!] == '') {
        gamePlay[selectedIndex!] = cross;
        count++;
        changeTurn = true;
      }
    }
    if (changeTurn == true) {
      if (gamePlay[selectedIndex!] == '') {
        gamePlay[selectedIndex!] = zero;
        count++;
        changeTurn = false;
      }
    }

    if (count == 9) {
      clear();
      notifyListeners();
    }

    if (gamePlay[0] == 'X' && gamePlay[1] == 'X' && gamePlay[2] == 'X') {
      player1++;
      clear();
    }
    if (gamePlay[3] == 'X' && gamePlay[4] == 'X' && gamePlay[5] == 'X') {
      player1++;
      clear();
    }
    if (gamePlay[6] == 'X' && gamePlay[7] == 'X' && gamePlay[8] == 'X') {
      player1++;
      clear();
    }
    if (gamePlay[0] == 'X' && gamePlay[3] == 'X' && gamePlay[6] == 'X') {
      player1++;
      clear();
    }
    if (gamePlay[1] == 'X' && gamePlay[4] == 'X' && gamePlay[7] == 'X') {
      player1++;
      clear();
    }
    if (gamePlay[2] == 'X' && gamePlay[5] == 'X' && gamePlay[8] == 'X') {
      player1++;
      clear();
    }
    if (gamePlay[0] == 'X' && gamePlay[4] == 'X' && gamePlay[8] == 'X') {
      player1++;
      clear();
    }
    if (gamePlay[2] == 'X' && gamePlay[4] == 'X' && gamePlay[6] == 'X') {
      player1++;
      clear();
    }

    if (gamePlay[0] == 'O' && gamePlay[1] == 'O' && gamePlay[2] == 'O') {
      player2++;
      clear();
    }
    if (gamePlay[3] == 'O' && gamePlay[4] == 'O' && gamePlay[5] == 'O') {
      player2++;
      clear();
    }
    if (gamePlay[6] == 'O' && gamePlay[7] == 'O' && gamePlay[8] == 'O') {
      player2++;
      clear();
    }
    if (gamePlay[0] == 'O' && gamePlay[3] == 'O' && gamePlay[6] == 'O') {
      player2++;
      clear();
    }
    if (gamePlay[1] == 'O' && gamePlay[4] == 'O' && gamePlay[7] == 'O') {
      player2++;
      clear();
    }
    if (gamePlay[2] == 'O' && gamePlay[5] == 'O' && gamePlay[8] == 'O') {
      player2++;
      clear();
    }
    if (gamePlay[0] == 'O' && gamePlay[4] == 'O' && gamePlay[8] == 'O') {
      player2++;
      clear();
    }
    if (gamePlay[2] == 'O' && gamePlay[4] == 'O' && gamePlay[6] == 'O') {
      player2++;
      clear();
    }
    notifyListeners();
  }

  void clear() {
    gamePlay = ['', '', '', '', '', '', '', '', ''];
    changeTurn = false;
    count = 0;
    notifyListeners();
  }

  void restart() {
    player1 = 0;
    player2 = 0;
    changeTurn = false;
    clear();
    notifyListeners();
  }
}
