import 'package:flutter/material.dart';
import 'package:n_puzzle/constants/enums.dart';

class PuzzleProvider extends ChangeNotifier {
  Algorithm _algorithm = Algorithm.manhattan;
  BoardSize _boardSize = BoardSize.three;

  Algorithm get algorithm => _algorithm;
  BoardSize get boardSize => _boardSize;

  void setAlgorithm(Algorithm newAlgo) {
    _algorithm = newAlgo;
  }

  void setBoardSize(BoardSize newSize) {
    _boardSize = newSize;
  }
}
