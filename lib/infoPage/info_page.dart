import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:filecam/colors.dart';
import 'package:filecam/infoPage/info_data.dart';

// ignore: must_be_immutable
class InfoPage extends StatefulWidget {
  String fileName;

  InfoPage(this.fileName, {super.key});

  @override
  InfoPageState createState() => InfoPageState();
}

class InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ColorChanger>(
      builder: (context, colorChanger, child) {
        Color mainColor = colorChanger.mainColor,
            secondColor = colorChanger.secondColor;
        return Container(
          // no height case the bottom sheet has a default height 415 that
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: secondColor,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25),
            ),
          ),
          child: Column(
            children: [
              Container(
                width: 50,
                height: 5,
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              SizedBox(
                height: 369,
                child: ListView(
                  padding: const EdgeInsets.only(bottom: 20),
                  children: [
                    // InfoData(checkType, header, paragraph),
                    // At checkType enter "h" to create a header or "p" to create a paragraph.
                    InfoData("h", "أسم الملف", ""),
                    InfoData("p", "", widget.fileName),
                    InfoData("h", "موقع التخزين", ""),
                    InfoData("p", "",
                        "ذاكرة الهاتف/الملف الرئيسي/filecam/${widget.fileName}"),
                    InfoData("h", "عدد الملفات", ""),
                    InfoData("p", "", "200"),
                    InfoData("h", "حجم الملف", ""),
                    InfoData("p", "", "50 ميجا بايت"),
                    InfoData("h", "تاريخ الإنشاء", ""),
                    InfoData("p", "", "23/9/2022"),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
