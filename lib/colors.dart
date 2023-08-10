import 'package:flutter/material.dart';

class ColorChanger extends ChangeNotifier {

//----- Palettes has a constant "Main Color" and "Third Color", but it changes in "Second Color".
/*
//----- Default Dark Mood:
  Color darkMoodMainColor = const Color.fromRGBO(20, 30, 39, 1);
  Color darkMoodThirdColor = Colors.white;

//----- Default Light Mood:
  Color lightMoodMainColor = Colors.white;
  Color lightMoodThirdColor = const Color.fromRGBO(20, 30, 39, 1);

//----- Theme 1:
  Color themeOneSecondColor = const Color.fromRGBO(161, 181, 125, 1);

//----- Theme 2:
  Color themeTwoSecondColor = const Color.fromRGBO(84, 18, 18, 1);

//----- Theme 3:
  Color themeThreeSecondColor = const Color.fromRGBO(179, 48, 48, 1);

//----- Theme 4:
  Color themeFourSecondColor = const Color.fromRGBO(30, 81, 40, 1);
*/

  String mood = "darkMood";
  bool switchValue = true;
  Color mainColor = const Color.fromRGBO(20, 30, 39, 1),
      secondColor = const Color.fromRGBO(161, 181, 125, 1),
      thirdColor = Colors.white;

  changeToDarkMode() {
    mainColor = const Color.fromRGBO(20, 30, 39, 1);
    thirdColor = Colors.white;
    mood == "darkMood";
    switchValue = true;
    notifyListeners();
  }

  changeToLightMode() {
    mainColor = Colors.white;
    thirdColor = const Color.fromRGBO(20, 30, 39, 1);
    mood == "lightMood";
    switchValue = false;
    notifyListeners();
  }

  changeToThemeOne() {
    secondColor = const Color.fromRGBO(161, 181, 125, 1);
    notifyListeners();
  }

  changeToThemeTwo() {
    secondColor = const Color.fromRGBO(84, 18, 18, 1);
    notifyListeners();
  }

  changeToThemeThree() {
    secondColor = const Color.fromRGBO(179, 48, 48, 1);
    notifyListeners();
  }

  changeToThemeFour() {
    secondColor = const Color.fromRGBO(30, 81, 40, 1);
    notifyListeners();
  }
}

/*
// I will use dark mood theme 1 as a default theme.
String mood = "darkMood";
Color mainColor = darkMoodMainColor,
    secondColor = themeOneSecondColor,
    thirdColor = darkMoodThirdColor;

void colorChanger() async {
  SharedPreferences sharedPreferencesUserData =
      await SharedPreferences.getInstance();
  if (sharedPreferencesUserData.getString("mood") == "darkMood") {
    mood = "darkMood";
    mainColor = darkMoodMainColor;
    thirdColor = darkMoodThirdColor;
  } else {
    mood = "lightMood";
    mainColor = lightMoodMainColor;
    thirdColor = lightMoodThirdColor;
  }
  if (sharedPreferencesUserData.getString("secondColor") ==
      "themeOneSecondColor") {
    secondColor = themeOneSecondColor;
  } else if (sharedPreferencesUserData.getString("secondColor") ==
      "themeTwoSecondColor") {
    secondColor = themeTwoSecondColor;
  } else if (sharedPreferencesUserData.getString("secondColor") ==
      "themeThreeSecondColor") {
    secondColor = themeThreeSecondColor;
  } else if (sharedPreferencesUserData.getString("secondColor") ==
      "themeFourSecondColor") {
    secondColor = themeFourSecondColor;
  }
}
*/
