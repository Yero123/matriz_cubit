import 'package:flutter/material.dart';
import 'package:matriz_bloc/Widgets/circle.dart';

class MatrizScreen extends StatelessWidget {
  String axisXselected;
  String axisYselected;
  Color colorSelected;
  Function(Color color) changeColor;
  Function(String positionX, String positionY) changePosition;
  MatrizScreen({
    required this.axisXselected,
    required this.axisYselected,
    required this.colorSelected,
    required this.changeColor,
    required this.changePosition,
  });
  double radio = 3;
  List<String> axisX = ["1", "2", "3", "4", "5"];
  List<String> axisY = ["1", "2", "3"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Painter"),
      ),
      body: Center(
        child: Column(
          children: [
            // MATRIZ DE CIRCULOS
            Column(
              children: [
                SizedBox(height: 20),
                generateRow(1),
                SizedBox(height: 20),
                generateRow(2),
                SizedBox(height: 20),
                generateRow(3),
              ],
            ),

            // DROPDOWNS Y BOTONES
            Expanded(
              child: Wrap(
                direction: Axis.vertical,
                alignment: WrapAlignment.end,
                children: [
                  Wrap(
                    spacing: 130,
                    children: [
                      builtDropDown(),
                      builtDropDown2(),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        onPressed: () => changeColor(Colors.amber),
                        backgroundColor: Colors.amber,
                      ),
                      SizedBox(width: 20),
                      FloatingActionButton(
                          onPressed: () => changeColor(Colors.blue)),
                      SizedBox(width: 20),
                      FloatingActionButton(
                        onPressed: () => changeColor(Colors.red),
                        backgroundColor: Colors.red,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> getOptionsDropDown(List eje) {
    List<DropdownMenuItem<String>> lista = [];
    eje
      ..forEach((option) {
        lista.add(DropdownMenuItem(
          child: Text(option),
          value: option,
        ));
      });
    return lista;
  }

  Widget builtDropDown() {
    return DropdownButton(
      value: axisXselected,
      items: getOptionsDropDown(axisX),
      onChanged: (opc) => {changePosition(opc.toString(), axisYselected)},
    );
  }

  Widget builtDropDown2() {
    return DropdownButton(
      value: axisYselected,
      items: getOptionsDropDown(axisY),
      onChanged: (opc) => {changePosition(axisXselected, opc.toString())},
    );
  }

  Widget generateRow(double column) {
    List<Circle> lista = [];

    for (double i = 1; i <= 5; i++) {
      lista.add(
        Circle(
          axisXselected: axisXselected,
          axisYselected: axisYselected,
          selectedColor: colorSelected,
          positionX: i,
          positionY: column,
        ),
      );
    }
    return Wrap(
      spacing: 15,
      children: lista,
    );
  }
}
