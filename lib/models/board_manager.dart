import 'dart:core';

import 'package:flutter/material.dart';
import 'package:n_puzzle/constants/enums.dart';
import 'package:n_puzzle/models/tile.dart';

class BoardManager {
  List<Tile> _tiles;
  BoardSize _boardSize;

  BoardManager({List<Tile> tiles, BoardSize boardSize}) {
    _tiles = tiles;
    _boardSize = boardSize;
  }

  bool get isWinning {
    return _tiles.every((Tile t) => t.value == t.goalValue);
  }

  List<Tile> getTilesCopy() {
    return _tiles
        .map((Tile t) =>
            Tile(position: t.position, value: t.value, goalValue: t.goalValue))
        .toList();
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

  Tile getBlankTile() {
    return _tiles.firstWhere((Tile t) => t.value == 0);
  }

  void updateNeihborTiles(List<Tile> tiles) {
    for (Tile tile in tiles) {
      Alignment up = Alignment(tile.position.x, tile.position.y - 1);
      Tile newUp = getTileAtPosition(position: up, tiles: tiles);
      tile.setUpTile(newUp);

      Alignment right = Alignment(tile.position.x + 1, tile.position.y);
      Tile newRight = getTileAtPosition(position: right, tiles: tiles);
      tile.setRightTile(newRight);

      Alignment down = Alignment(tile.position.x, tile.position.y + 1);
      Tile newDown = getTileAtPosition(position: down, tiles: tiles);
      tile.setDownTile(newDown);

      Alignment left = Alignment(tile.position.x - 1, tile.position.y);
      Tile newLeft = getTileAtPosition(position: left, tiles: tiles);
      tile.setLeftTile(newLeft);
    }
  }

  Tile getTileAtPosition({Alignment position, List<Tile> tiles}) {
    return tiles.firstWhere((Tile t) => t.position == position, orElse: null);
  }
}
