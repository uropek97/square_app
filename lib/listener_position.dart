import 'package:flutter/material.dart';

class ListenerPosition extends ChangeNotifier{
  double _positionX;
  double _positionY;

  ListenerPosition(this._positionX, this._positionY);

  double get positionX => _positionX;
  double get positionY => _positionY;

  void moveObj(double stepX, double stepY){
    _positionX += stepX;
    _positionY += stepY;

    notifyListeners();
  }
}