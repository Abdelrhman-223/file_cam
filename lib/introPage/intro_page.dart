import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:filecam/colors.dart';
import 'package:filecam/introPage/skip_buttons.dart';
import 'package:filecam/introPage/slider_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController indicatorController = PageController();
  bool onLastPage = false;

  void startSharedPreferences() async {
    SharedPreferences sharedPreferencesUserData =
        await SharedPreferences.getInstance();
    if (!sharedPreferencesUserData.containsKey("mood")) {
      sharedPreferencesUserData.setString("mood", "darkMood");
      sharedPreferencesUserData.setString("mainColor", "darkMoodMainColor");
      sharedPreferencesUserData.setString(
          "secondColor", "darkMoodThemeOneSecondColor");
      sharedPreferencesUserData.setString("thirdColor", "darkMoodThirdColor");
    }
    // Write the next line with the old code.
    //colorChanger();
  }

  @override
  Widget build(BuildContext context) {
    startSharedPreferences();
    return Consumer<ColorChanger>(
      builder: (context, colorChanger, child) {
        Color secondColor = colorChanger.secondColor,
            thirdColor = colorChanger.thirdColor;
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                PageView(
                  controller: indicatorController,
                  reverse: true,
                  onPageChanged: (index) {
                    setState(() {
                      (index == 3.0) ? onLastPage = true : onLastPage = false;
                    });
                  },
                  children: [
                    // Slider Page create the content of the page and it take image path, header and description in order.
                    SliderPage(
                        "assets/images/pnges/personal_files.png",
                        "إنشاء ملفات",
                        "قم بإنشاء ملفات مختلفة ومعبرة عن الصور المخزنة بها لتسهل عليك الوصول اليها."),
                    SliderPage(
                        "assets/images/pnges/image_folder.png",
                        "ملفات الصور",
                        "قم بالتقاط الصور الخاصة بك وخزن جميع الصور المتشابهة في ملف واحد."),
                    SliderPage(
                        "assets/images/pnges/hidden.png",
                        "تأمين الملفات",
                        "قم بغلق الملفات الخاصة بك بكلمة سر لزيادة الأمان والخصوصية."),
                    SliderPage(
                        "assets/images/pnges/personal_files.png",
                        "مشاركة الصور",
                        "قم بمشاركة الصور او الملف باكمله مع العائلة او الصدقاء."),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(right: 20, top: 20),
                  child: SkipButtons("تخطي", thirdColor),
                ),
                Container(
                  alignment: const Alignment(0, 0.6),
                  child: SmoothPageIndicator(
                    controller: indicatorController,
                    count: 4,
                    textDirection: TextDirection.ltr,
                    effect: ScrollingDotsEffect(
                      activeDotColor: secondColor,
                      dotColor: thirdColor,
                      dotWidth: 12,
                      dotHeight: 12,
                      activeDotScale: 1.5,
                    ),
                  ),
                ),
                onLastPage
                    ? Container(
                        alignment: const Alignment(0, 0.8),
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SkipButtons("النهاية", secondColor),
                            GestureDetector(
                              onTap: () {
                                indicatorController.previousPage(
                                    duration: const Duration(milliseconds: 250),
                                    curve: Curves.easeIn);
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "السابق",
                                    style: TextStyle(
                                      color: secondColor,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 20,
                                    color: secondColor,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        alignment: const Alignment(0, 0.8),
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                indicatorController.nextPage(
                                    duration: const Duration(milliseconds: 250),
                                    curve: Curves.easeIn);
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.arrow_back_ios_rounded,
                                    size: 20,
                                    color: secondColor,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "التالي",
                                    style: TextStyle(
                                      color: secondColor,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                indicatorController.previousPage(
                                    duration: const Duration(milliseconds: 250),
                                    curve: Curves.easeIn);
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "السابق",
                                    style: TextStyle(
                                      color: secondColor,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 20,
                                    color: secondColor,
                                  ),
                                ],
                              ),
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
