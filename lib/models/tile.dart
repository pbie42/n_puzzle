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
    Tile upTile,
    Tile downTile,
    Tile leftTile,
    Tile rightTile,
  }) {
    _position = position;
    _value = value;
    _goalValue = goalValue;
    _upTile = upTile;
    _downTile = downTile;
    _leftTile = leftTile;
    _rightTile = rightTile;
  }

  Alignment get position => _position;
  int get value => _value;
  int get goalValue => _goalValue;
  Tile get upTile => _upTile;
  Tile get downTile => _downTile;
  Tile get leftTile => _leftTile;
  Tile get rightTile => _rightTile;
}
