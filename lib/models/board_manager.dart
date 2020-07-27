import 'dart:core';

import 'package:n_puzzle/constants/enums.dart';
import 'package:n_puzzle/models/tile.dart';

class BoardManager {
  List<Tile> _tiles;
  BoardSize _boardSize;

  BoardManager({List<Tile> tiles, BoardSize boardSize}) {
    _tiles = tiles;
    _boardSize = boardSize;
  }

  bool isWinning() {
    return _tiles.every((Tile t) => t.value == t.goalValue);
  }

  int getManhattanDistance() {
    int manhattanDistance = 0;
    for (Tile tile in _tiles) {
      Tile goalTile = getTileFromValue(tile.goalValue);
      manhattanDistance += countManhattanDistance(tile, goalTile);
    }
    return manhattanDistance;
  }

  int countManhattanDistance(Tile tile, Tile goalTile) {
    int manhattanDistance = 0;
    manhattanDistance += (tile.position.x - goalTile.position.x).abs().toInt();
    manhattanDistance += (tile.position.y - goalTile.position.y).abs().toInt();
    return manhattanDistance;
  }

  Tile getTileFromValue(int value) {
    return _tiles.firstWhere((Tile t) => t.value == value);
  }
}
