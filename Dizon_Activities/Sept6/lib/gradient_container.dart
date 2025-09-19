import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color1, this.color2, {super.key, required this.activescreen});

  final dynamic color1;
  final dynamic color2;
  final Widget? activescreen;

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
      child: Center(
        //child: StyledText('Mascy Sylvan'),
        //child: Image.asset('assets/img/meme1.png', width: 200, height: 200,),
        child: activescreen,
      ),
    );
  }
}
