import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matriz_bloc/matriz_screen.dart';

import 'bloc/matriz_bloc/matriz_bloc.dart';
import 'bloc/matriz_bloc/matriz_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  MatrizBloc blocM = MatrizBloc();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatrizBloc, MatrizState>(
      bloc: blocM,
      builder: (context, state) {
        return MatrizScreen(
          axisXselected: state.positionX,
          axisYselected: state.positionY,
          colorSelected: state.selectedColor,
          changeColor: blocM.changeColor,
          changePosition: blocM.changePosition,
        );
      },
    );
  }
}
