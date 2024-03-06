import 'package:flutter/material.dart';

class ListenerPosition extends ChangeNotifier{
  double _positionX;
  double _positionY;
  double _size;

  ListenerPosition(this._positionX, this._positionY, [this._size = 100]);

  double get positionX => _positionX;
  double get positionY => _positionY;
  double get size => _size;

  void moveObj(double stepX, double stepY, double height, double width){
    _positionX += stepX;
    _positionY += stepY;

    _positionX = _positionX.clamp(0, width - _size);
    _positionY = _positionY.clamp(0, height - _size);

    notifyListeners();
  }

  bool canMoveUp(){
    return _positionY > 0;
  }
  bool canMoveDown(double height){
    return _positionY < height - _size;
  }
  bool canMoveLeft(){
    return _positionX > 0;
  }
  bool canMoveRight(double width){
    return _positionX < width - _size;
  }
}