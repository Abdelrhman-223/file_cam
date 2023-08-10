// ignore: unused_import
import 'package:filecam/colors.dart';
import 'package:filecam/main.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SkipButtons extends StatelessWidget {
  String buttonText;
  Color buttonColor;

  SkipButtons(this.buttonText, this.buttonColor, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MyHomePage()),
        );
      },
      child: Row(
        children: [
          Icon(
            Icons.arrow_back_ios_rounded,
            size: 20,
            color: buttonColor,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            buttonText,
            style: TextStyle(
              color: buttonColor,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
