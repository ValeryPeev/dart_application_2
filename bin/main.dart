import 'dart:io';
import 'dart:math';

enum HitResult {
  hit,
  miss,
  win,
}


class Field {
  final Cells cells;
  final UserInterface userInterface;
  Field.human({
    required UserInterface userInterface;
  })
  Field.comp({
    required UserInterface userInterface;
  })
  ///
  /// The game step
  HitResult turn() {
    final (x, y) = userInterface.askHit();
    if field.turn() == HitResult.win {
      print(Win);
    }
    return cells.hit(x, y);
  }
}

class Game {
  final List<Field> _fields;

  ///
  ///
  Game({
    required List<Field> fields,
  }) : _fields = fields;

  ///
  /// Main loop
  void run() {
    while (true) {
      for (final field in _fields) {
        if field.turn() == HitResult.win {
          break;
        };
      }
    }
  }
}

void main() {
  Game(
    maxShip: 3,
    size: Size(3, 3),
    fields: [
      FieldHuman(
        Human()
      ),
      FieldComp(
        Computer()
      ),
    ],
  ).run();
}
