import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const PosApp());
}

class PosApp extends StatefulWidget {
  const PosApp({Key? key}) : super(key: key);

  @override
  State<PosApp> createState() => _PosAppState();
}

class _PosAppState extends State<PosApp> {
  bool Dark = false;

  void toggleTheme() => setState(() => Dark = !Dark);

  @override
  Widget build(BuildContext context) {
    final seed = const Color(0xFFEB1A55);
    final colorScheme = ColorScheme.fromSeed(seedColor: seed);
    final darkScheme = ColorScheme.fromSeed(
      seedColor: seed,
      brightness: Brightness.dark,
    );

    return MaterialApp(
      theme: ThemeData(colorScheme: colorScheme, useMaterial3: true),
      darkTheme: ThemeData(
        colorScheme: darkScheme,
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      themeMode: Dark ? ThemeMode.dark : ThemeMode.light,
      home: LoginScreen(
        () {}, 
        false, 
        '', 
        goToHome: (u) {},
        goToRegister: () {},
      ),
    );
  }
}
