import 'package:flutter/material.dart';
import 'package:flutter_app/gradient_container.dart';

void main() {
  // runApp(const MaterialApp(home: Text('Hello World!'),));
  runApp(
    MaterialApp(
      home: Scaffold(
        body: GradientContainer(const Color.fromARGB(255, 247, 158, 220), const Color.fromARGB(255, 209, 81, 234)),
      ),
    ),
  );
}
