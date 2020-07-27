import 'package:flutter/material.dart';

class Tile {
  Alignment _position;
  int _value;
  int _goalValue;

  Tile _upTile;
  Tile _downTile;
  Tile _leftTile;
  Tile _rightTile;

  Tile({
    Alignment position,
    int value,
    int goalValue,
  }) {
    _position = position;
    _value = value;
    _goalValue = goalValue;
  }

  Alignment get position => _position;
  int get value => _value;
  int get goalValue => _goalValue;
  Tile get upTile => _upTile;
  Tile get downTile => _downTile;
  Tile get leftTile => _leftTile;
  Tile get rightTile => _rightTile;

  void setUpTile(Tile newTile) {
    _upTile = newTile;
  }

  void setDownTile(Tile newTile) {
    _downTile = newTile;
  }

  void setLeftTile(Tile newTile) {
    _leftTile = newTile;
  }

  void setRightTile(Tile newTile) {
    _rightTile = newTile;
  }
}
