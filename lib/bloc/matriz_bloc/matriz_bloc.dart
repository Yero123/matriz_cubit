import 'package:matriz_bloc/bloc/matriz_bloc/matriz_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class MatrizBloc extends Cubit<MatrizState> {
  MatrizBloc()
      : super(MatrizState(
            positionX: "1", positionY: "1", selectedColor: Colors.blue));
            
  // Cambiar el color del circulo pintado
  changeColor(Color color  ) {
    emit(state.copywith(color: color));
    
  }
  // Cambiar la posicion del circulo pintado
  changePosition(String positionX, String positionY ) {
    emit(MatrizState(positionX: positionX, positionY: positionY));
    
  }
}
