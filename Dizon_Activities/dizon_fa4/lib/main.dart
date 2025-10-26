import 'package:dizon_fa4/commons/gradient_container.dart';
import 'package:dizon_fa4/start_screen.dart';
import 'package:dizon_fa4/widgets/grocery_list.dart';
import 'package:dizon_fa4/widgets/new_item.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 87, 5, 83),
          brightness: Brightness.dark,
          surface: const Color.fromARGB(255, 82, 7, 87),
          ),
        scaffoldBackgroundColor: Colors.transparent
      ), 
      home: Scaffold(
        body: Stack(
          children: [
            const GradientContainer(
              Color.fromARGB(255, 116, 11, 111),
              Color.fromARGB(255, 223, 147, 208),
            ),
            const StartScreen(),
          ],
        ),
      ),
    );
  }
}

