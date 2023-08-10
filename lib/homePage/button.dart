import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:filecam/colors.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  IconData iconName;
  bool activePage;

  Button(this.iconName, this.activePage, {super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorChanger>(
      builder: (context, colorChanger, child) {
        Color mainColor = colorChanger.mainColor,
            secondColor = colorChanger.secondColor;
        return Container(
          decoration: BoxDecoration(
              color: (activePage) ? secondColor : mainColor,
              border: Border.all(
                color: (activePage) ? mainColor : secondColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(7.5)),
          padding: const EdgeInsets.all(2.5),
          child: Icon(
            iconName,
            color: (activePage) ? mainColor : secondColor,
            size: 30,
          ),
        );
      },
    );
  }
}
