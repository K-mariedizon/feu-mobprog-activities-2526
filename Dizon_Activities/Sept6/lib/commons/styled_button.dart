import 'package:flutter/material.dart';
import 'package:flutter_app/commons/styled_text.dart';

class StyledButton extends StatelessWidget {
  const StyledButton({
    super.key,
    required this.text,
    required this.buttonListener,
  });

  final String text;
  final void Function() buttonListener;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(10)
        //shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(20))
      ),
      child: StyledText(text, 30, const Color.fromARGB(255, 0, 0, 0)),
    );
  }
}
