import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double fill;

  const ChartBar({super.key, required this.fill});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      height: double.infinity,
      child: FractionallySizedBox(
        heightFactor: fill,
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: const Color(0xFFEB1A55),
          ),
        ),
      ),
    );
  }
}
