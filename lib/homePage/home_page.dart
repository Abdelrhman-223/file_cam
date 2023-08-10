import 'package:filecam/homePage/folder_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List folderName = [
    "الملف الأول",
    "الملف الثاني",
    "الملف الثالث",
    "الملف الرابع",
  ];
  List firstImage = [
    "assets/images/pnges/image_folder.png",
    "assets/images/pnges/image_folder.png",
    "assets/images/pnges/photo_sharing.png",
    "assets/images/pnges/hidden.png",
  ];
  List secondImage = [
    "assets/images/pnges/hidden.png",
    "assets/images/pnges/photo_sharing.png",
    "assets/images/pnges/image_folder.png",
    "assets/images/pnges/image_folder.png",
  ];
  List thirdImage = [
    "assets/images/pnges/photo_sharing.png",
    "assets/images/pnges/hidden.png",
    "assets/images/pnges/hidden.png",
    "assets/images/pnges/photo_sharing.png",
  ];
  List lockCheck = [
    true,
    false,
    false,
    true,
  ];
  List pinCheck = [
    true,
    false,
    true,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: folderName.length,
        itemBuilder: (context, index) => FolderCard(
          folderName[index],
          firstImage[index],
          secondImage[index],
          thirdImage[index],
          pinCheck[index],
          lockCheck[index],
        ),
      ),
    );
  }
}
