import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color1, this.color2, this.child, {super.key});

  final dynamic color1;
  final dynamic color2;
  final Column child;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: child,
    );
  }
}
