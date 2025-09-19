import 'package:flutter/material.dart';
import 'package:flutter_basics/commons/styled_button.dart';
import 'package:flutter_basics/commons/styled_text.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.onCategorySelected});

  final void Function(String category) onCategorySelected;

  @override
  Widget build(BuildContext context) {
    final categories = ["Marvel", "DC", "Sanrio"];

    return Center(
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          spacing: 15,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StyledText("Choose a Category", 30, Colors.white),
            ...categories.map((cat) {
              return StyledButton(
                text: cat,
                buttonListener: () => onCategorySelected(cat),
              );
            }),
          ],
        ),
      ),
    );
  }
}
