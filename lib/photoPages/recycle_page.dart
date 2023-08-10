import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:filecam/colors.dart';
import 'package:filecam/photoPages/sub_folder_card.dart';
import 'package:filecam/popupMenu/sort_menu_button.dart';

// ignore: must_be_immutable
class RecyclePage extends StatefulWidget {
  const RecyclePage({super.key});

  @override
  State<RecyclePage> createState() => _RecyclePageState();
}

class _RecyclePageState extends State<RecyclePage> {
  List deletedFolderNames = [
    "ملف محذوف-1",
    "ملف محذوف-2",
    "ملف محذوف-3",
    "ملف محذوف-4",
    "ملف محذوف-5",
  ];
  List deletedImages = [
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
    setState(() {});
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
              "المحذوفات",
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
                        "عدد الملفات: ${deletedFolderNames.length}",
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
                        itemCount: deletedFolderNames.length,
                        itemBuilder: (context, index) =>
                            SubFolderCard(deletedFolderNames[index]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        "عدد الصور: ${deletedImages.length}",
                        style: TextStyle(
                          color: secondColor,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: (deletedImages.length % 3 == 0)
                      ? ((deletedImages.length / 3).toDouble() * 100) +
                          ((deletedImages.length / 3).toDouble() * 20)
                      : (((deletedImages.length ~/ 3) + 1).toDouble() * 100) +
                          (((deletedImages.length ~/ 3) + 1).toDouble() * 20),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: GridView.builder(
                    itemCount: deletedImages.length,
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
                        deletedImages[index],
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
