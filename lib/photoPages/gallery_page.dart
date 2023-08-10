import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:filecam/colors.dart';
import 'package:filecam/homePage/button.dart';
import 'package:filecam/photoPages/sub_folder_card.dart';
import 'package:filecam/popupMenu/pop_up_menu_button.dart';
import 'package:filecam/popupMenu/sort_menu_button.dart';

// ignore: must_be_immutable
class GalleryPage extends StatefulWidget {
  String folderName;

  GalleryPage(this.folderName, {super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  List subFolderNames = [
    "ملف داخلي-1",
    "ملف داخلي-2",
    "ملف داخلي-3",
    "ملف داخلي-4",
    "ملف داخلي-5",
  ];
  List images = [
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
              widget.folderName,
              style: TextStyle(
                fontSize: 25,
                color: thirdColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.backspace),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              const SortMenuButton(),
              PopUpMenuButton(widget.folderName),
            ],
          ),
          body: SafeArea(
            child: Stack(
              children: [
                ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(top: 20),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        "عدد الملفات: ${subFolderNames.length}",
                        style: TextStyle(
                          color: secondColor,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: subFolderNames.length,
                        itemBuilder: (context, index) =>
                            SubFolderCard(subFolderNames[index]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        "عدد الصور: ${images.length}",
                        style: TextStyle(
                          color: secondColor,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    GridView.builder(
                      itemCount: images.length,
                      shrinkWrap: true,
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
                          images[index],
                          style: TextStyle(
                            color: thirdColor,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
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
                            setState(() {
                              images.add("Image-${images.length + 1}");
                            });
                          },
                          child:
                              Button(Icons.add_photo_alternate_rounded, false),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {});
                          },
                          child: Button(Icons.video_call_rounded, false),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              subFolderNames.add(
                                  "ملف داخلي-${subFolderNames.length + 1}");
                            });
                          },
                          child: Button(Icons.note_add_rounded, false),
                        ),
                      ],
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
