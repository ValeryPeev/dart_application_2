
import 'playershoots.dart';
import 'computershoots.dart';

class BattleshipGame {
  final Player player;
  final Computer computer;

  BattleshipGame(this.player, this.computer);

  void play() {
    while (!player.field.isGameOver() && !computer.field.isGameOver()) {
      player.takeTurn();
      if (computer.field.isGameOver()) break;

      computer.takeTurn();
      if (player.field.isGameOver()) break;

      print('\n Текущее состояние вашего поля:');
      computer.field.displayField(); 
      print('\n Текущее состояние поля компьютера:');
      player.field.displayField(); 
    }
    if (player.field.isGameOver()) {
      print('Вы победили!');
    } else {
      print('Вы проиграли!');
    }
  }
}