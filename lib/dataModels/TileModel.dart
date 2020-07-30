import 'dart:math';

class TileModel {
  final int number;
  final Point<int> targetPosition;
  final Point<int> currentPosition;

  const TileModel(this.number, this.targetPosition, this.currentPosition);
}
