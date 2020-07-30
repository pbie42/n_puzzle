import 'package:flutter/material.dart';
import 'package:n_puzzle/dataModels/TileModel.dart';

class PuzzleTile extends StatelessWidget {
  final TileModel tileModel;

  PuzzleTile(this.tileModel);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 0.5),
        ),
        child: Text('${tileModel.number + 1}'),
      ),
    );
  }
}
