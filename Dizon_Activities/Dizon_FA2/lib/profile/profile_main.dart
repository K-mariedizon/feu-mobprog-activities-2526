import 'package:flutter/material.dart';
import 'package:flutter_basics/data/profile_data.dart';
import 'package:flutter_basics/profile/profile_screen.dart';
import 'package:flutter_basics/profile/profile_summary.dart';
import 'package:flutter_basics/start_screen.dart';
import 'package:flutter_basics/category_screen.dart';

class ProfileMain extends StatefulWidget {
  const ProfileMain({super.key});

  @override
  State<ProfileMain> createState() {
    return _ProfileMainState();
  }
}

class _ProfileMainState extends State<ProfileMain> {
  final List<Map<String, String>> selectedInfo = [];
  var activeScreen = 'start-screen';
  String selectedCategory = '';
  int score = 0;

  void switchToCategoryScreen() {
    setState(() {
      activeScreen = 'category-screen';
    });
  }

  void switchToProfileScreen(String category) {
    setState(() {
      selectedInfo.clear();
      selectedCategory = category;
      score = 0;
      activeScreen = 'profile-screen';
    });
  }

  void goToHome() {
    setState(() {
      selectedInfo.clear();
      selectedCategory = '';
      score = 0;
      activeScreen = 'start-screen';
    });
  }

  void addSelectedInfoItem(String question, String selected, String correct) {
    if (selected == correct) {
      score++;
    }
    selectedInfo.add({
      "question": question,
      "selected": selected,
      "correct": correct,
    });

    if (selectedInfo.length >= profileCategories[selectedCategory]!.length) {
      setState(() {
        activeScreen = 'summary-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = StartScreen(switchToCategoryScreen);

    if (activeScreen == 'category-screen') {
      currentScreen = CategoryScreen(
        onCategorySelected: switchToProfileScreen,
      );
    } else if (activeScreen == 'profile-screen') {
      currentScreen = ProfileScreen(
        onInfoItemSelection: addSelectedInfoItem,
        category: selectedCategory,
      );
    } else if (activeScreen == 'summary-screen') {
      currentScreen = ProfileSummary(
        selectedInfo: selectedInfo,
        score: score,
        retakeprofile: () => switchToProfileScreen(selectedCategory),
        goToHome: goToHome,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 117, 17, 34),
                Color.fromARGB(255, 33, 32, 33),
              ],
            ),
          ),
          child: currentScreen,
        ),
      ),
    );
  }
}
