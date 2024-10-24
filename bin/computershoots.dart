
import 'dart:math';
import 'field.dart';

class Computer {
  final BattleshipField field;
  final List<List<int>> shots; // хранение выстрелов компьютера

  Computer(this.field) : shots = [];

  void takeTurn() {
    Random random = Random();
    
    int row, col;

    do {
      row = random.nextInt(field.size);
      col = random.nextInt(field.size);
    } while (shots.any((shot) => shot[0] == row && shot[1] == col)); // Проверяем, стрелял ли компьютер в эту клетку

    shots.add([row, col]); // запоминаем выстрел, чтобы компьютер не повторялся

    print('Компьютер стреляет в ($row, $col)');
    
    if (field.shoot(row, col)) {
      print('Компьютер попадает!');
    } else {
      print('Компьютер промахивается!');
    }
  }
}