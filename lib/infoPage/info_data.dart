import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:filecam/colors.dart';

// ignore: must_be_immutable
class InfoData extends StatelessWidget {
  String checkType, header, paragraph;

  InfoData(this.checkType, this.header, this.paragraph, {super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorChanger>(
      builder: (context, colorChanger, child) {
        Color mainColor = colorChanger.mainColor,
            thirdColor = colorChanger.thirdColor;
        return (checkType == "h")
            ? Text(
                "$header:",
                softWrap: true,
                style: TextStyle(
                  color: thirdColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              )
            : Text(
                "$paragraph.",
                softWrap: true,
                style: TextStyle(
                  color: mainColor,
                  fontSize: 20,
                ),
              );
      },
    );
  }
}
