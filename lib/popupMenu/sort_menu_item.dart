import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:filecam/colors.dart';

// ignore: must_be_immutable
class SortMenuItem extends StatelessWidget {
  String itemTitle;

  SortMenuItem(this.itemTitle, {super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorChanger>(
      builder: (context, colorChanger, child) {
        Color mainColor = colorChanger.mainColor,
            secondColor = colorChanger.secondColor;
        return Container(
          width: 150,
          height: 40,
          padding: const EdgeInsets.only(right: 20),
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: secondColor,
              width: 2,
            ),
          ),
          child: Text(
            itemTitle,
            style: TextStyle(
              color: secondColor,
              fontSize: 20,
            ),
          ),
        );
      },
    );
  }
}
