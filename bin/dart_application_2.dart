import 'dart:io';
import 'dart:math';

const String EMPTY = '.';
const String SHIP = '1';
const String HIT = '2';
const String MISS = 'O';

class Battleship {
  List<List<String>> playerField;
  List<List<String>> enemyField;
  int playerShips;
  int enemyShips;
  int size; 

  Battleship(this.size)
      : playerField = List.generate(size, (_) => List.filled(size, EMPTY)),
        enemyField = List.generate(size, (_) => List.filled(size, EMPTY)),
        playerShips = 0,
        enemyShips = 0;

  void placeShips(int numberOfShips) {
    for (int i = 0; i < numberOfShips; i++) {
      placeSingleShip(playerField);
    }
    for (int i = 0; i < numberOfShips; i++) {
      placeSingleShip(enemyField);
    }
  }

  void displayFields() {
    print("Player Field");
    displayField(playerField);
    print("Skynet Field");
    displayField(enemyField);
  }

  void playerTurn() {
    print("Your turn! Enter x y");
    var input = stdin.readLineSync()!.split(' ');
    int y = int.parse(input[0]) - 1;
    int x = int.parse(input[1]) - 1;

    if (enemyField[x][y] == SHIP) {
      print("Hit");
      enemyField[x][y] = HIT;
      enemyShips--;
    } else {
      print("Miss");
      enemyField[x][y] = MISS;
    }
  }

  void enemyTurn() {
    Random random = Random();
    int x, y;

    do {
      x = random.nextInt(size);
      y = random.nextInt(size);
    } while (playerField[x][y] == HIT || playerField[x][y] == MISS);

    if (playerField[x][y] == SHIP) {
      print("Skynet hit");
      playerField[x][y] = HIT;
      playerShips--;
    } else {
      print("Skynet missed");
      playerField[x][y] = MISS;
    }
  }

  bool isGameOver() => playerShips <= 0 || enemyShips <= 0;

  void placeSingleShip(List<List<String>> field) {
    Random random = Random();
    int x, y;

    do {
      x = random.nextInt(size);
      y = random.nextInt(size);
    } while (field[x][y] == SHIP);

    field[x][y] = SHIP;

    if (field == playerField) {
      playerShips++;
    } else {
      enemyShips++;
    }
  }

  void displayField(List<List<String>> field) {
    for (var row in field) {
      print(row.join(' '));
    }
  }

  String getWinner() {
    if (playerShips <= 0) return "Skynet won!";
    if (enemyShips <= 0) return "Player won!";  
    return "";
  }
}

void main() {
  print("Enter the size ");
  int size = int.parse(stdin.readLineSync()!);
  print("Enter the number of ships: ");
  int numberOfShips = int.parse(stdin.readLineSync()!);
  Battleship game = Battleship(size);
  game.placeShips(numberOfShips);
  while (!game.isGameOver()) {
    game.displayFields();
    game.playerTurn();
    if (!game.isGameOver()) {
      game.enemyTurn();
    }
  }
  print(game.getWinner());
}