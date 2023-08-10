import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:filecam/colors.dart';

// ignore: must_be_immutable
class MyPopupMenuItem extends StatelessWidget {
  IconData iconName;
  String itemTitle;

  MyPopupMenuItem(this.iconName, this.itemTitle, {super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorChanger>(
      builder: (context, colorChanger, child) {
        Color mainColor = colorChanger.mainColor,
            secondColor = colorChanger.secondColor;
        return Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: secondColor,
                  width: 2,
                ),
              ),
              child: Icon(
                iconName,
                color: secondColor,
                size: 20,
              ),
            ),
            Container(
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
            ),
          ],
        );
      },
    );
  }
}
/*
ListTile(
leading: Icon(
iconName,
color: secondColor,
size: 20,
),
title: Text(
itemTitle,
style: TextStyle(color: secondColor),
),
)
*/
