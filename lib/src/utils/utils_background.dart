import 'package:flutter/material.dart';

BoxDecoration globalDecoration() {
  return const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color.fromARGB(255, 255, 255, 255),
        Color.fromARGB(255, 83, 209, 251)
      ],
      stops: [0.0, 1.0],
      begin: FractionalOffset.topCenter,
      end: FractionalOffset.bottomCenter,
      tileMode: TileMode.repeated,
    ),
  );
}
