import 'package:flutter/material.dart';
import 'package:flutter_app/gradient_container.dart';
import 'package:flutter_app/image_changer.dart';
import 'package:flutter_app/profile/profile_screen.dart';

class ProfileMain extends StatefulWidget {
  const ProfileMain({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProfileMainState();
  }
}

class _ProfileMainState extends State<ProfileMain> {
//   Widget? activescreen;

// @override
//   void initState() {
//    activescreen = ImageChanger(switchscreen);
//     super.initState();
//   }

  // void switchscreen() {
  //   setState(() {
  //     activescreen = const ProfileScreen();
  //   });
  // }

 var activescreen = 'start-screen';
void switchscreen() {
    setState(() {
      activescreen = 'profile-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
   Widget currentscreen = ImageChanger(switchscreen);

   if (activescreen == 'profile-screen'){
    currentscreen = ProfileScreen();
   }

    return MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          const Color.fromARGB(255, 247, 247, 247),
          const Color.fromARGB(255, 244, 49, 218),
          activescreen: currentscreen,
        ),
      ),
    );
  }
}
