import 'package:flutter/foundation.dart';

enum Algorithm {
  manhattan,
  linear,
  pattern,
}

extension AlgorithmExtension on Algorithm {
  String get name => describeEnum(this);

  String get displayTitle {
    switch (this) {
      case Algorithm.manhattan:
        return "Manhattan Distance";
      case Algorithm.linear:
        return "Linear Conflict";
      case Algorithm.pattern:
        return "Pattern Database";
    }
    return '';
  }
}

enum BoardSize {
  three,
  four,
  five,
}

extension BoardSizeExtension on BoardSize {
  String get name => describeEnum(this);

  String get displayTitle {
    switch (this) {
      case BoardSize.three:
        return "3 x 3";
      case BoardSize.four:
        return "4 x 4";
      case BoardSize.five:
        return "5 x 5";
    }
    return '';
  }

  int get value {
    switch (this) {
      case BoardSize.three:
        return 3;
      case BoardSize.four:
        return 4;
      case BoardSize.five:
        return 5;
    }
    return 0;
  }
}

enum ShiftDirection {
  up,
  down,
  left,
  right,
}

extension ShiftDirectionExtension on ShiftDirection {
  String get name => describeEnum(this);

  String get displayTitle {
    switch (this) {
      case ShiftDirection.up:
        return "Up";
      case ShiftDirection.down:
        return "Down";
      case ShiftDirection.left:
        return "Left";
      case ShiftDirection.right:
        return "Right";
    }
    return '';
  }
}
