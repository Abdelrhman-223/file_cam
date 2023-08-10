import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:filecam/colors.dart';
import 'package:filecam/homePage/button.dart';
import 'package:filecam/homePage/home_page.dart';
import 'package:filecam/introPage/intro_page.dart';
import 'package:filecam/photoPages/important_page.dart';
import 'package:filecam/photoPages/recycle_page.dart';
import 'package:filecam/settingsPage/settings_page.dart';
import 'package:filecam/unusedCodes/bottom_bar.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ColorChanger(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  startSharedPreferences() async {
    SharedPreferences sharedPreferencesUserData =
        await SharedPreferences.getInstance();
    if (!sharedPreferencesUserData.containsKey("mood")) {
      sharedPreferencesUserData.setString("mood", "darkMood");
      sharedPreferencesUserData.setString("mainColor", "darkMoodMainColor");
      sharedPreferencesUserData.setString(
          "secondColor", "darkMoodThemeOneSecondColor");
      sharedPreferencesUserData.setString("thirdColor", "darkMoodThirdColor");
      sharedPreferencesUserData.setBool("firstTime", true);
    }
    return (sharedPreferencesUserData.getBool("firstTime") == false)? false : true;
    // Write the next line with the old code.
    //colorChanger();
  }

  @override
  Widget build(BuildContext context) {
    startSharedPreferences();
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'), // English, no country code
      ],
      home: (startSharedPreferences() == true)
              ? const IntroPage()
              : const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int pageIndex = 0;
  bool sideMenuActive = false;
  bool bottomMenuActive = false;
  bool homePageActive = true;
  bool settingsPageActive = false;
  bool importantPageActive = false;
  bool recyclePageActive = false;

  List<Widget> pages = [
    const HomePage(),
    const SettingsPage(),
    const ImportantPage(),
    const RecyclePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorChanger>(
      builder: (context, colorChanger, child) {
        Color mainColor = colorChanger.mainColor,
            secondColor = colorChanger.secondColor;
        return Scaffold(
          backgroundColor: mainColor,
          body: SafeArea(
            child: Stack(
              children: [
                IndexedStack(
                  index: pageIndex,
                  children: pages,
                ),
                (sideMenuActive)
                    ? Align(
                        alignment: const Alignment(0.8, 0),
                        child: Container(
                          margin: const EdgeInsets.only(top: 150),
                          child: Column(
                            children: [
                              Container(
                                width: 60,
                                height: 275,
                                decoration: BoxDecoration(
                                  color: mainColor,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: secondColor,
                                    width: 2,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          pageIndex = 0;
                                          homePageActive = true;
                                          settingsPageActive = false;
                                          importantPageActive = false;
                                          recyclePageActive = false;
                                        });
                                      },
                                      child: Button(
                                          Icons.home_filled, homePageActive),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          pageIndex = 1;
                                          homePageActive = false;
                                          settingsPageActive = true;
                                          importantPageActive = false;
                                          recyclePageActive = false;
                                        });
                                      },
                                      child: Button(
                                          Icons.settings, settingsPageActive),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          pageIndex = 2;
                                          homePageActive = false;
                                          settingsPageActive = false;
                                          importantPageActive = true;
                                          recyclePageActive = false;
                                        });
                                      },
                                      child: Button(
                                          Icons.bookmark, importantPageActive),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          pageIndex = 3;
                                          homePageActive = false;
                                          settingsPageActive = false;
                                          importantPageActive = false;
                                          recyclePageActive = true;
                                        });
                                      },
                                      child: Button(
                                          Icons.delete, recyclePageActive),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 60,
                                height: 60,
                                margin:
                                    const EdgeInsets.symmetric(vertical: 20),
                                decoration: BoxDecoration(
                                  color: mainColor,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: secondColor,
                                    width: 2,
                                  ),
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.close_rounded,
                                    color: secondColor,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      sideMenuActive = false;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Align(
                        alignment: const Alignment(0.8, 0),
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: secondColor,
                              width: 2,
                            ),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.menu_rounded,
                              color: secondColor,
                              size: 30,
                            ),
                            onPressed: () {
                              setState(() {
                                sideMenuActive = true;
                              });
                            },
                          ),
                        ),
                      ),
                (recyclePageActive)
                    ? Align(
                        alignment: const Alignment(0, 0.8),
                        child: Container(
                          width: 225,
                          height: 60,
                          decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: secondColor,
                              width: 2,
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {});
                                },
                                child: Button(Icons.refresh_rounded, false),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {});
                                },
                                child: Button(Icons.delete_rounded, false),
                              ),
                            ],
                          ),
                        ),
                      )
                    : (settingsPageActive)
                        ? const SizedBox()
                        : const BottomBar(),
              ],
            ),
          ),
        );
      },
    );
  }
}
