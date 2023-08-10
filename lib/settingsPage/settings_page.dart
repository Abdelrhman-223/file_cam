import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:filecam/colors.dart';
import 'package:filecam/homePage/shadow_line.dart';
import 'package:filecam/settingsPage/color_palette.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController generalPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorChanger>(
      builder: (context, colorChanger, child) {
        Color mainColor = colorChanger.mainColor,
        secondColor = colorChanger.secondColor,
        thirdColor = colorChanger.thirdColor;
        return Scaffold(
          backgroundColor: mainColor,
          appBar: AppBar(
            backgroundColor: secondColor,
            title: Text(
              "الإعدادات",
              style: TextStyle(
                fontSize: 25,
                color: thirdColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: secondColor,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black87,
                        blurRadius: 7,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "الوضع المظلم",
                              style: TextStyle(
                                color: thirdColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Switch(
                              value: colorChanger.switchValue,
                              activeColor: thirdColor,
                              activeTrackColor: mainColor,
                              inactiveThumbColor: mainColor,
                              inactiveTrackColor: thirdColor,
                              onChanged: (value) async {
                                SharedPreferences sharedPreferencesUserData =
                                await SharedPreferences.getInstance();
                                if (colorChanger.switchValue) {
                                  sharedPreferencesUserData.setString(
                                      "mood", "lightMood");
                                  colorChanger.changeToLightMode();
                                } else {
                                  sharedPreferencesUserData.setString(
                                      "mood", "darkMood");
                                  colorChanger.changeToDarkMode();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      const ShadowLine(),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "الوان البرنامج",
                              style: TextStyle(
                                color: thirdColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ColorPalette(const Color.fromRGBO(161, 181, 125, 1)),
                                ColorPalette(const Color.fromRGBO(84, 18, 18, 1)),
                                ColorPalette(const Color.fromRGBO(179, 48, 48, 1)),
                                ColorPalette(const Color.fromRGBO(30, 81, 40, 1)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: secondColor,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black87,
                        blurRadius: 7,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: DropdownButton(
                    isExpanded: false,
                    underline: const SizedBox(height: 0,),
                    dropdownColor: secondColor,
                    borderRadius: BorderRadius.circular(25),
                    hint: Text(
                      "الملف المثبت",
                      style: TextStyle(
                        color: thirdColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    items: [
                      DropdownMenuItem(
                        value: 1,
                        child: Text(
                          "الملف الأول",
                          style: TextStyle(
                            color: thirdColor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 2,
                        child: Text(
                          "الملف الثاني",
                          style: TextStyle(
                            color: thirdColor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 3,
                        child: Text(
                          "الملف الثالث",
                          style: TextStyle(
                            color: thirdColor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                    onChanged: (value) {},
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: secondColor,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black87,
                        blurRadius: 7,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          "غلق جميع الملفات",
                          style: TextStyle(
                            color: thirdColor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 200,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: mainColor.withOpacity(0.50),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: TextField(
                              controller: generalPasswordController,
                              cursorColor: thirdColor,
                              style: TextStyle(
                                color: thirdColor,
                              ),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: mainColor.withOpacity(0.50),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              "أغلق",
                              style: TextStyle(
                                color: thirdColor,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
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
