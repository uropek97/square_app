import 'package:flutter/material.dart';

class ListenerPosition extends ChangeNotifier{
  double _positionX;
  double _positionY;
  double heigh;
  double width;

  ListenerPosition(this._positionX, this._positionY, [this.heigh = 600, this.width = 300]);

  double get positionX => _positionX;
  double get positionY => _positionY;

  void moveObj(double stepX, double stepY){
    _positionX += stepX;
    _positionY += stepY;

    _positionX = _positionX.clamp(0, width);
    _positionY = _positionY.clamp(0, heigh);

    notifyListeners();
  }
}