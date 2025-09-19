import 'package:flutter/material.dart';
import 'package:flutter_basics/commons/styled_text.dart';

class ProfileSummaryItem extends StatelessWidget {
  const ProfileSummaryItem(this.summaryData, {super.key});

  final List<Map<String, String>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StyledText(data['question']!, 20, const Color.fromARGB(255, 255, 255, 255)),
                      StyledText("Your Answer: ${data['selected']!}", 15, const Color.fromARGB(255, 155, 155, 155)),
                      if (data['selected'] != data['correct'])
                        StyledText("Correct Answer: ${data['correct']!}", 15, Colors.green),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
