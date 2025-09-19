import 'package:flutter/material.dart';
import 'package:flutter_app/commons/styled_button.dart';
import 'package:flutter_app/commons/styled_text.dart';
import 'package:flutter_app/data/profile_data.dart';
import 'package:flutter_app/models/profile_info.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<StatefulWidget> createState() {
  return _ProfileScreenState();
  }
}

class _ProfileScreenState extends State<ProfileScreen>{
var currentInfoIndex = 0;

  void itemClick(){
   setState(() {
     currentInfoIndex++;
   });
  }

    @override
  Widget build(BuildContext context) {
 ProfileInfo currentInfo = profileData[currentInfoIndex];

  return Center(
    child: Container(
      margin: EdgeInsets.all(20),
      child: Column(
        spacing: 15,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
         StyledText(currentInfo.InfoDescription, 30, Colors.white),
         SizedBox(height: 30),
        //  StyledButton(text: currentInfo.InforItems[0], buttonListener: (){}),
        //  StyledButton(text: currentInfo.InforItems[1], buttonListener: (){}),
        //  StyledButton(text: currentInfo.InforItems[2], buttonListener: (){}),
        ...currentInfo.getShuffledList().map((item){
         return StyledButton(text: item, buttonListener: itemClick);
        }),
      
        ],
      ),
    ),
  );
}
}