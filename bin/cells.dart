///
/// The cell of the Buttle field game,
/// Have one of fallowing stattes:
/// - Empty
/// - Ship
/// - Hit
class Cells {
  List<List<Cell>> _cells;

  ///
  ///
  Cells({
    required List<List<Cell>> cells,
  }) : _cells = cells;

  ///
  /// The game step
  /// - [x] -
  HitResult hit(x, y) {
    bool ships = 0;
    for (final row in _cells) {
      for (final c in row) {
        if (c == Cell.ship) {
          ships++;
        }
      }
    }
    switch (_cells[x][y]) {
      case Cell.empty:
        return HitResult.miss;
      case Cell.hit:
        return HitResult.miss;
      case Cell.ship:
        return HitResult.hit;
    }
  }
}

///
/// State of the [Cells]
enum Cell {
  empty,
  ship,
  hit,
}
