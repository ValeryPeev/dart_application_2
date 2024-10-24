// battleship_field.dart
import 'dart:math';

class BattleshipField {
  final int size;
  late List<List<String>> _field;
  final int singleDeckShips;
  int remainingShips; // Счетчик оставшихся кораблей

  BattleshipField(this.size, this.singleDeckShips)
      : remainingShips = singleDeckShips {
    _initializeField();
    _placeSingleDeckShips();
  }

 

  void _initializeField() {           //задаем поле
    _field = List.generate(size, (_) => List.filled(size, '~'));
  }

  void _placeSingleDeckShips() {    //расставляем корабли
    Random random = Random();
    int placedShips = 0;

    while (placedShips < singleDeckShips) {
      int row = random.nextInt(size);
      int col = random.nextInt(size);

      if (_field[row][col] == '~') {
        _field[row][col] = 'S'; // ставим корабль
        placedShips++;
      }
    }
  }

  bool shoot(int row, int col) {
    if (_field[row][col] == 'S') {
      _field[row][col] = 'X'; // попадание
      remainingShips--; 
      return true;
    } else if (_field[row][col] == '~') {
      _field[row][col] = 'O'; // промахи тоже остаются на поле
      return false;
    }
    return false; // Если уже стреляли в эту клетку
  }

  void displayField() {   //показать корабли
    for (var row in _field) {
      print(row.join(' '));
    }
  }

  bool isGameOver() {
    return remainingShips <= 0; // проверка количества кораблей
  }
}