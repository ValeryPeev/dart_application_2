
import 'dart:io';
import 'field.dart';

class Player {
  final BattleshipField field;

  Player(this.field);

  void takeTurn() {
    print('Ваш ход! Введите координаты (строка и столбец):');
    int row = int.parse(stdin.readLineSync()!) - 1; // задаем строку и столбец, -1 для удобства
    int col = int.parse(stdin.readLineSync()!) - 1;

    if (field.shoot(row, col)) {
      print('Попадание!');
    } else {
      print('Промах!');
    }
  }
}