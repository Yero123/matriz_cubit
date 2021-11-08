import 'package:flutter/material.dart';
class Circle extends StatelessWidget {
  const Circle({
    Key? key,
    required this.positionX,
    required this.positionY,
    required this.axisXselected,
    required this.axisYselected,
    required this.selectedColor,
  }) : super(key: key);

  final double positionX;
  final double positionY;
  final Color selectedColor;
  final String axisXselected;
  final String axisYselected;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: setColor(selectedColor),
      ),
      width: 60,
      height: 60,
    );
  }

  Color setColor(Color selected) {
    Color opcion;
    if (positionX.toString() == axisXselected &&
        positionY.toString() == axisYselected) {
      opcion = selected;
    } else {
      opcion = Colors.black;
    }

    return opcion;
  }
}