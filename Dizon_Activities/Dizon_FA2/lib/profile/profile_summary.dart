import 'package:flutter/material.dart';
import 'package:flutter_basics/commons/styled_button.dart';
import 'package:flutter_basics/commons/styled_text.dart';
import 'package:flutter_basics/profile/profile_summary_item.dart';

class ProfileSummary extends StatelessWidget {
  const ProfileSummary({
    super.key,
    required this.selectedInfo,
    required this.score,
    required this.retakeprofile,
    required this.goToHome,
  });

  final List<Map<String, String>> selectedInfo;
  final int score;
  final void Function() retakeprofile;
  final void Function() goToHome;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(50),
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StyledText('Your Score: $score / ${selectedInfo.length}', 30, Colors.white),
            ProfileSummaryItem(selectedInfo),
            StyledButton(text: 'Retake Quiz', buttonListener: retakeprofile),
            StyledButton(text: 'Home', buttonListener: goToHome),
          ],
        ),
      ),
    );
  }
}

