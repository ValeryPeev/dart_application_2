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
      for (final f in _fields) {
        if f.turn() == HitResult.win {
          print(Win);
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
      Field.human(
        Human()
      ),
      Field.comp(
        Computer()
      ),
    ],
  ).run();
}
