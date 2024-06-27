import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider for the Controller class
final controllerProvider = ChangeNotifierProvider((ref) => Controller());

class Controller extends ChangeNotifier {
  final bKey = GlobalKey<FormState>();

  List<String> gameValue = ["", "", "", "", "", "", "", "", ""];
  bool isX = false;
  int click = 0;

  // Win conditions represented by indices in the game grid
  final List<List<int>> winConditions = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
    [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
    [0, 4, 8], [2, 4, 6] // Diagonals
  ];

  void addValue(int index) {
    if (gameValue[index] == "") {
      gameValue[index] = isX ? "X" : "O";
      isX = !isX;
      click++;
      notifyListeners();

      // Check for win after every move
      checkWin();
    } else {
      print("Invalid Click");
    }

    // Check for draw after every move
    if (click == 9) {
      matchDrawMessage();
    }
  }

  void checkWin() {
    for (var condition in winConditions) {
      if (gameValue[condition[0]] != "" &&
          gameValue[condition[0]] == gameValue[condition[1]] &&
          gameValue[condition[1]] == gameValue[condition[2]]) {
        // Show win dialog
        showDialog(
          context: bKey.currentContext!,
          builder: (context) {
            return AlertDialog(
              title: Text("Winner"),
              content: Text("${gameValue[condition[0]]} wins!"),
              actions: [
                TextButton(
                  onPressed: () {
                    resetGame();
                    Navigator.of(context).pop();
                  },
                  child: Text("Play Again"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel"),
                ),
              ],
            );
          },
        );
        return;
      }
    }
  }

  void matchDrawMessage() {
    // Show draw dialog
    showDialog(
      context: bKey.currentContext!,
      builder: (context) {
        return AlertDialog(
          title: Text("Match Draw"),
          content: Text("The game is a draw!"),
          actions: [
            TextButton(
              onPressed: () {
                resetGame();
                Navigator.of(context).pop();
              },
              child: Text("Play Again"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  void resetGame() {
    gameValue = ["", "", "", "", "", "", "", "", ""];
    isX = false;
    click = 0;
    notifyListeners();
  }
}
