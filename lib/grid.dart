import 'package:flutter/material.dart';

class PuzzleGrid extends StatefulWidget {
  @override
  _PuzzleGridState createState() => _PuzzleGridState();
}

class _PuzzleGridState extends State<PuzzleGrid> {
  int size = 3;

  List<List<int>> currentState = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 0],
  ];
//  List<List<int>> currentState = [
//    [1, 2, 3, 4],
//    [5, 6, 7, 8],
//    [9, 10, 11, 12],
//    [13, 14, 15, 0],
//  ];

//  List<List<int>> currentState = [
//    [1, 2, 3, 4, 5],
//    [6, 7, 8, 9, 10],
//    [11, 12, 13, 14, 15],
//    [16, 17, 18, 19, 20],
//    [21, 22, 23, 24, 0],
//  ];

  @override
  Widget build(BuildContext context) {
    var numberOfItems = size * size;
    var boardWidth = MediaQuery.of(context).size.width;

    return Container(
      height: boardWidth,
      width: boardWidth,
      child: GridView.count(
          crossAxisCount: size,
          physics: NeverScrollableScrollPhysics(),
          childAspectRatio: 1,
          children: List.generate(numberOfItems, (index) {
            return Tile(
              currentState: currentState,
              index: index,
            );
          })),
    );
  }
}

class Tile extends StatelessWidget {
  Tile({Key key, @required this.currentState, this.index}) : super(key: key);

  final List<List<int>> currentState;
  final int index;

  @override
  Widget build(BuildContext context) {
    int x, y = 0;
    x = (index / currentState.first.length).floor();
    y = (index % currentState.first.length);

    return Container(
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 0.5)),
        child: Center(
          child: Text(currentState[x][y].toString()),
        ));
  }
}
