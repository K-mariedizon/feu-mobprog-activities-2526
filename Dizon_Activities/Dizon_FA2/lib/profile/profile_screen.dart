import 'package:flutter/material.dart';
import 'package:flutter_basics/commons/styled_button.dart';
import 'package:flutter_basics/commons/styled_text.dart';
import 'package:flutter_basics/data/profile_data.dart';
import 'package:flutter_basics/models/profile_info.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
    required this.onInfoItemSelection,
    required this.category,
  });

  final void Function(String question, String selected, String correct) onInfoItemSelection;
  final String category;

  @override
  State<ProfileScreen> createState() {
    return _ProfileScreenState();
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  var currentInfoIndex = 0;
  String? wrongAnswer;

  void itemClick(ProfileInfo currentInfo, String selectedItem) {
    widget.onInfoItemSelection(
      currentInfo.infoDescription,
      selectedItem,
      currentInfo.correctAnswer,
    );

    setState(() {
      wrongAnswer = selectedItem != currentInfo.correctAnswer ? currentInfo.correctAnswer : null;
      currentInfoIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentInfoIndex >= profileCategories[widget.category]!.length) {
      return const Center(child: CircularProgressIndicator());
    }

    ProfileInfo currentInfo = profileCategories[widget.category]![currentInfoIndex];

    return Center(
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          spacing: 15,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StyledText("Category: ${widget.category}", 20, Colors.yellow),
            StyledText(currentInfo.infoDescription, 30, Colors.white),
            const SizedBox(height: 30),
            ...currentInfo.getShuffledList().map((item) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch, 
                children: [
                  StyledButton(
                    text: item,
                    buttonListener: () => itemClick(currentInfo, item),
                  ),
                ]
              );
            }),
          ],
        ),
      ),
    );
  }
}
