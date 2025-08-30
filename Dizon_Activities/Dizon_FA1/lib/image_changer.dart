import 'package:flutter/material.dart';
import 'dart:math';

class ImageChanger extends StatefulWidget {
  const ImageChanger({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ImageChangerState();
  }

}

class _ImageChangerState extends State<ImageChanger> {
  int activeImage = 4;

  void imageFunction() {
    setState(() {
      activeImage = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(context) {
    return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(
              'assets/img/s.png',
              width: 500,
              height: 250,
            ),
            Image.asset(
              'assets/img/$activeImage.png',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20,),
            TextButton(
              onPressed: imageFunction,
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(20),
                foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                textStyle: const TextStyle(fontSize: 28),
              ),
              //child: StyledText('Click Me!'),
              child: const Text('Roll The Dice!'),
            ),
          ],
        );
  }
}