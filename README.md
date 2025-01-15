# food_menu

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
import 'package:flutter/material.dart';

void main() {
runApp(TicTacToeApp());
}

class TicTacToeApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
debugShowCheckedModeBanner: false,
title: 'Tic Tac Toe',
theme: ThemeData(
primarySwatch: Colors.blue,
),
home: TicTacToeGame(),
);
}
}

class TicTacToeGame extends StatefulWidget {
@override
_TicTacToeGameState createState() => _TicTacToeGameState();
}

class _TicTacToeGameState extends State<TicTacToeGame> {
List<String> board = List.filled(9, '');
String currentPlayer = 'X';
String result = '';

void resetGame() {
setState(() {
board = List.filled(9, '');
currentPlayer = 'X';
result = '';
});
}

void handleTap(int index) {
if (board[index] != '' || result != '') return;

    setState(() {
      board[index] = currentPlayer;
      if (checkWin()) {
        result = '$currentPlayer Wins!';
      } else if (board.every((cell) => cell != '')) {
        result = 'It\'s a Draw!';
      } else {
        currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
      }
    });
}

bool checkWin() {
const winPatterns = [
[0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
[0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
[0, 4, 8], [2, 4, 6], // Diagonals
];

    for (var pattern in winPatterns) {
      if (board[pattern[0]] == currentPlayer &&
          board[pattern[1]] == currentPlayer &&
          board[pattern[2]] == currentPlayer) {
        return true;
      }
    }
    return false;
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text(
'Tic Tac Toe',
style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
),
centerTitle: true,
),
body: Container(
decoration: BoxDecoration(
gradient: LinearGradient(
colors: [Colors.blue.shade200, Colors.blue.shade900],
begin: Alignment.topLeft,
end: Alignment.bottomRight,
),
),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Text(
result.isEmpty ? 'Turn: $currentPlayer' : result,
style: TextStyle(
fontSize: 28,
fontWeight: FontWeight.bold,
color: Colors.white,
),
),
SizedBox(height: 20),
Expanded(
child: GridView.builder(
padding: EdgeInsets.all(16.0),
gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: 3,
crossAxisSpacing: 8.0,
mainAxisSpacing: 8.0,
),
itemCount: 9,
itemBuilder: (context, index) => GestureDetector(
onTap: () => handleTap(index),
child: Container(
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(12.0),
boxShadow: [
BoxShadow(
color: Colors.black26,
blurRadius: 6.0,
offset: Offset(2, 2),
),
],
),
child: Center(
child: Text(
board[index],
style: TextStyle(
fontSize: 48,
fontWeight: FontWeight.bold,
color: board[index] == 'X'
? Colors.redAccent
: Colors.greenAccent,
),
),
),
),
),
),
),
SizedBox(height: 20),
ElevatedButton(
onPressed: resetGame,
style: ElevatedButton.styleFrom(
padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(8.0),
),
),
child: Text(
'Reset Game',
style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
),
),
SizedBox(height: 20),
],
),
),
);
}
}
