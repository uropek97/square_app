import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

class CubePosition {
  final MainAxisAlignment positionX;
  final CrossAxisAlignment positionY;
  
  const CubePosition(this.positionX, this.positionY);
}

List<MainAxisAlignment> positionsX = [
  MainAxisAlignment.start,
  MainAxisAlignment.center,
  MainAxisAlignment.end
];

List<CrossAxisAlignment> positionsY = [
  CrossAxisAlignment.start,
  CrossAxisAlignment.center,
  CrossAxisAlignment.end
];

class CubeCubit extends Cubit<CubePosition> {
  int x;
  int y;

  CubeCubit([this.x = 1, this.y = 1])
      : super(CubePosition(positionsX[x], positionsY[y]));

  void moveUp() {
    y--;
    final newPos = CubePosition(positionsX[x], positionsY[y]);
    emit(newPos);
  }

  void moveDown() {
    y++;
    emit(CubePosition(positionsX[x], positionsY[y]));
  }

  void moveLeft() {
    x--;
    final newPos = CubePosition(positionsX[x], positionsY[y]);
    emit(newPos);
  }

  void moveRight() {
    x++;
    emit(CubePosition(positionsX[x], positionsY[y]));
  }

  bool canMoveUp() {
    return y != 0;
  }

  bool canMoveDown() {
    return y != 2;
  }

  bool canMoveLeft() {
    return x != 0;
  }

  bool canMoveRight() {
    return x != 2;
  }
}