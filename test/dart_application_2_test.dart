import 'package:dart_application_2/dart_application_2.dart';
import 'package:test/test.dart';

import '../bin/cells.dart';

void main() {
  test('cells', () {
    final testData = [
      (
        [
          [Cell.empty, Cell.empty, Cell.empty],
          [Cell.empty, Cell.ship, Cell.empty],
          [Cell.empty, Cell.empty, Cell.empty],
        ],
        Hit(1, 2),
      )
    ];
    for ((cells, target) in testData) {
      final cells = Cells(cells: cells);

      assert(cells.hit(x, y), target);
    }
  });
}
