import 'dart:math';

import 'package:flutter/material.dart';
import 'package:n_puzzle/dataModels/TileModel.dart';
import 'package:n_puzzle/dataModels/boardModel.dart';
import 'package:n_puzzle/widgets/PuzzleTile.dart';

class PuzzleBoard extends StatefulWidget {
  final BoardModel board;

  final double size;

  PuzzleBoard({Key key, @required this.board, @required this.size})
      : super(key: key);

  @override
  _PuzzleBoardState createState() => _PuzzleBoardState();
}

class _PuzzleBoardState extends State<PuzzleBoard> {
  List<_Tile> tileCopies;

  @override
  void initState() {
    super.initState();
    _setNewPuzzleBoard(newPuzzleBoard: widget.board);
  }

  void _setNewPuzzleBoard({final BoardModel newPuzzleBoard}) {
    if (newPuzzleBoard == null) {
      print("Oops. We do not have a board to play with!");
    }

    if (tileCopies == null) {
      setState(() {
        tileCopies = newPuzzleBoard.tiles.map((tile) {
          final x = tile.currentPosition.x / newPuzzleBoard.size;
          final y = tile.currentPosition.y / newPuzzleBoard.size;
          return _Tile(x, y, tile.currentPosition);
        }).toList(growable: false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final puzzleBoard = widget.board;

    if (puzzleBoard == null) {
      return Text("There is no board to play with");
    }

    final tiles = puzzleBoard.tiles.map(_buildPuzzleTile).toList();

    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Stack(
        children: tiles,
      ),
    );
  }

  Widget _buildPuzzleTile(TileModel tile) {
    final board = widget.board;
    final tileCopy = tileCopies[tile.number];

    final tileSize = widget.size / board.size;
    return Positioned(
      width: tileSize,
      height: tileSize,
      left: tileCopy.x * widget.size,
      top: tileCopy.y * widget.size,
      child: PuzzleTile(
        tile,
      ),
    );
  }
}

class _Tile {
  double x = 0;
  double y = 0;

  Point<int> currentPoint;

  _Tile(
    this.x,
    this.y,
    this.currentPoint,
  );
}
