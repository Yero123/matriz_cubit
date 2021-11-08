import 'package:flutter/material.dart';

class MatrizState {
  final String positionX;
  final String positionY;
  final Color selectedColor;
  copywith({String? positionX, String? positionY, Color? color}) {
    return MatrizState(positionX: positionX??this.positionX,positionY: positionY??this.positionY, selectedColor: color??this.selectedColor);
  }
  MatrizState({
    this.positionX = "1",
    this.positionY = "1",
    this.selectedColor = Colors.blue,

  });
}
