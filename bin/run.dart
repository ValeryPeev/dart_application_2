
import 'dart:io';
import 'field.dart';
import 'playershoots.dart';
import 'computershoots.dart';
import 'count.dart';

void run() {
  
  print('Введите размер поля (например, 10):');
  int size = int.parse(stdin.readLineSync()!);

  print('Введите количество однопалубных кораблей:');
  int singleDeckShips = int.parse(stdin.readLineSync()!);

  BattleshipField playerField = BattleshipField(size, singleDeckShips);
  Player player = Player(playerField);
  
  BattleshipField computerField = BattleshipField(size, singleDeckShips);
  Computer computer = Computer(computerField);
  
  BattleshipGame game = BattleshipGame(player, computer);
  
  game.play(); 
}