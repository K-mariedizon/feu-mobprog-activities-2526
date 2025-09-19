import 'package:flutter/material.dart';

import 'package:flutter_app/commons/styled_text.dart';

class ImageChanger extends StatelessWidget {
  const ImageChanger(this.switchscreen, {super.key});

  final void Function() switchscreen;

  @override
  Widget build(context) {
    return Column(
      spacing: 20,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/img/1.png',
          width: 300,
          height: 300,
        ),
        Text(
          'My Melody',
          style: TextStyle(
            fontSize: 28,
            color: const Color.fromARGB(255, 138, 1, 70),
          ),
        ),
        // FilledButton(
        //   onPressed: buttonFunction,
        //   style: TextButton.styleFrom(
        //     padding: EdgeInsets.all(20),
        //     foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        //     textStyle: const TextStyle(fontSize: 28),
        //   ),
        //   child: const Text('Start'),
        // ),
        OutlinedButton.icon(
          onPressed: switchscreen, 
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white
          ),
          icon: Icon(Icons.arrow_right_alt),
          label: StyledText('Start', 20, Colors.white),
        ),
      ],
    );
  }
}
