import 'dart:math';

import 'package:n_puzzle/dataModels/TileModel.dart';

class BoardModel {
  int size;

  List<TileModel> tiles;

  Point<int> blankTile;

  BoardModel(this.size, this.tiles, this.blankTile);

  factory BoardModel.createWithSize(int size) =>
      BoardModel.create(size, (index) => Point(index % size, index ~/ size));

  BoardModel.create(int size, Point<int> Function(int) builder) {
    final blankTile = builder(size * size - 1);
    final tiles = List<TileModel>.generate(size * size - 1, (index) {
      final point = builder(index);
      return TileModel(index, point, point);
    });
    this.size = size;
    this.tiles = tiles;
    this.blankTile = blankTile;
  }
}
