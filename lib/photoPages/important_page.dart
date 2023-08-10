import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:filecam/colors.dart';
import 'package:filecam/photoPages/sub_folder_card.dart';
import 'package:filecam/popupMenu/sort_menu_button.dart';

// ignore: must_be_immutable
class ImportantPage extends StatefulWidget {
  const ImportantPage({super.key});

  @override
  State<ImportantPage> createState() => _ImportantPageState();
}

class _ImportantPageState extends State<ImportantPage> {
  List importantFolderNames = [
    "ملف محفوظ-1",
    "ملف محفوظ-2",
    "ملف محفوظ-3",
    "ملف محفوظ-4",
    "ملف محفوظ-5",
  ];
  List importantImages = [
    "Image-1",
    "Image-2",
    "Image-3",
    "Image-4",
    "Image-5",
    "Image-6",
    "Image-7",
    "Image-8",
    "Image-9",
    "Image-10",
    "Image-11",
    "Image-12",
    "Image-13",
    "Image-14",
  ];

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
              "المحفوظات",
              style: TextStyle(
                fontSize: 25,
                color: thirdColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: const [
              SortMenuButton(),
            ],
          ),
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.only(top: 20),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        "عدد الملفات: ${importantFolderNames.length}",
                        style: TextStyle(
                          color: secondColor,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 190,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: importantFolderNames.length,
                        itemBuilder: (context, index) =>
                            SubFolderCard(importantFolderNames[index]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        "عدد الصور: ${importantImages.length}",
                        style: TextStyle(
                          color: secondColor,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: (importantImages.length % 3 == 0)
                      ? ((importantImages.length / 3).toDouble() * 100) +
                          ((importantImages.length / 3).toDouble() * 20)
                      : (((importantImages.length ~/ 3) + 1).toDouble() * 100) +
                          (((importantImages.length ~/ 3) + 1).toDouble() * 20),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: GridView.builder(
                    itemCount: importantImages.length,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (context, index) => Container(
                      width: 100,
                      height: 100,
                      color: secondColor,
                      padding: const EdgeInsets.only(top: 40, right: 15),
                      margin: const EdgeInsets.all(10),
                      child: Text(
                        importantImages[index],
                        style: TextStyle(
                          color: thirdColor,
                          fontSize: 18,
                        ),
                      ),
                    ),
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
