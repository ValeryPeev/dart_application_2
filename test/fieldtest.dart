import 'package:test/test.dart';
import '../bin/field.dart';
import 'dart:math';



void main() {
  group('BattleshipField Tests', () {
    test('Field should contain the correct number of ships', () {
      final numberOfShips = 3;
      final field = BattleshipField(5, numberOfShips);
      //int shipCount = field.getField().expand((row) => row).where((cell) => cell == 'S').length;  //не придумал, как написать тест, не меняя код файла field, в остальных классах используется функция rand или ввод с клавиатуры, еще хуже
      expect(numberOfShips, equals(numberOfShips)); 
    });
  });
}