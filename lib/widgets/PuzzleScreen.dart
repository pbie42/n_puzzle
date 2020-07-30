import 'dart:math';

import 'package:flutter/material.dart';
import 'package:n_puzzle/dataModels/boardModel.dart';
import 'package:n_puzzle/widgets/PuzzleBoard.dart';

class PuzzleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final puzzleBoard = _buildBoard(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("N-PUZZLE"),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: puzzleBoard,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBoard(final BuildContext context) {
    final BoardModel board = BoardModel.createWithSize(3);

    return Center(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(16)),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final boardSize = min(constraints.maxWidth, constraints.maxHeight);
            return PuzzleBoard(board: board, size: boardSize);
          },
        ),
      ),
    );
  }
}
