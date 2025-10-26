import 'package:dizon_fa4/commons/styled_text.dart';
import 'package:dizon_fa4/widgets/grocery_list.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  //final void Function() switchScreen;

  void switchScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => GroceryList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 20,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/img/s.png',
            width: 300,
            height: 300,
          ),
          StyledText('Welcome to \n My House Inventory', 30, Colors.white),
          // OutlinedButton(
          //   onPressed: () {},
          //   child: StyledText('Start', 20, Colors.white),
          // ),
          OutlinedButton.icon(
            onPressed: (){
              switchScreen(context);
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 255, 255, 255),
              side: BorderSide(
                color: const Color.fromARGB(255, 82, 11, 84),
                width: 2,
              ),
            ),
            icon: Icon(Icons.arrow_right_alt),
            label: StyledText('Start', 20, Colors.white),
          ),
        ],
      ),
    );
  }
}
