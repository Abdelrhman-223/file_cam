import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:filecam/colors.dart';

// ignore: must_be_immutable
class SliderPage extends StatelessWidget {
  // Initialize the data that will used in the page.
  String imagePath;
  String header;
  String description;

  // Initialize that this widget take those variables.
  SliderPage(this.imagePath, this.header, this.description, {super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorChanger>(
      builder: (context, colorChanger, child) {
        Color mainColor = colorChanger.mainColor,
            secondColor = colorChanger.secondColor,
            thirdColor = colorChanger.thirdColor;
        return Container(
          color: mainColor,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            // don't use the mainAxisAlignment to don't destroy the stack combination.
            children: [
              Image.asset(
                imagePath,
                width: 200,
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                header,
                style: TextStyle(
                  color: secondColor,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                description,
                style: TextStyle(
                  color: thirdColor,
                  fontSize: 20,
                ),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        );
      },
    );
  }
}
