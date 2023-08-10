import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:filecam/colors.dart';

// ignore: must_be_immutable
class ColorPalette extends StatefulWidget {
  Color secondColor;

  ColorPalette(this.secondColor, {super.key});

  @override
  State<ColorPalette> createState() => _ColorPaletteState();
}

class _ColorPaletteState extends State<ColorPalette> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ColorChanger>(
      builder: (context, colorChanger, child) {
        Color mainColor = colorChanger.mainColor,
            thirdColor = colorChanger.thirdColor;
        return GestureDetector(
          onTap: () async {
            SharedPreferences sharedPreferencesUserData =
                await SharedPreferences.getInstance();
            setState(() {
              if (widget.secondColor ==
                  const Color.fromRGBO(161, 181, 125, 1)) {
                sharedPreferencesUserData.setString(
                    "secondColor", "themeOneSecondColor");
                colorChanger.changeToThemeOne();
              } else if (widget.secondColor ==
                  const Color.fromRGBO(84, 18, 18, 1)) {
                sharedPreferencesUserData.setString(
                    "secondColor", "themeTwoSecondColor");
                colorChanger.changeToThemeTwo();
              } else if (widget.secondColor ==
                  const Color.fromRGBO(179, 48, 48, 1)) {
                sharedPreferencesUserData.setString(
                    "secondColor", "themeThreeSecondColor");
                colorChanger.changeToThemeThree();
              } else if (widget.secondColor ==
                  const Color.fromRGBO(30, 81, 40, 1)) {
                sharedPreferencesUserData.setString(
                    "secondColor", "themeFourSecondColor");
                colorChanger.changeToThemeFour();
              }
            });
          },
          child: SizedBox(
            width: 60,
            height: 60,
            child: Row(
              children: [
                Container(
                  width: 30,
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 2,
                        offset: Offset(0, 0),
                        spreadRadius: 1,
                      )
                    ],
                  ),
                ),
                Container(
                  width: 20,
                  decoration: BoxDecoration(
                    color: widget.secondColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 2,
                        offset: Offset(0, 0),
                        spreadRadius: 1,
                      )
                    ],
                  ),
                ),
                Container(
                  width: 10,
                  decoration: BoxDecoration(
                    color: thirdColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 2,
                        offset: Offset(0, 0),
                        spreadRadius: 1,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
