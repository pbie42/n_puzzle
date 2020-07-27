import 'package:n_puzzle/constants/enums.dart';
import 'package:n_puzzle/models/board_manager.dart';
import 'package:n_puzzle/models/tile.dart';

class BoardNode {
  List<Tile> _tiles;

  ShiftDirection _previousMove;
  BoardNode _previousNode;
  BoardSize _boardSize;
  BoardManager _boardManager;

  BoardNode(List<Tile> tiles, BoardSize size) {
    _tiles = tiles;
    _boardSize = size;
    _boardManager = BoardManager(tiles: _tiles, boardSize: _boardSize);
  }

  int get cost {
    return _boardManager.getManhattanDistance();
  }

  bool get isSolution {
    return _boardManager.isWinning();
  }
}
