import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:filecam/colors.dart';
import 'package:filecam/infoPage/info_page.dart';
import 'package:filecam/popupMenu/pop_up_menu_item.dart';

// ignore: must_be_immutable
class PopUpMenuButton extends StatefulWidget {
  String folderName;

  PopUpMenuButton(this.folderName, {super.key});

  @override
  State<PopUpMenuButton> createState() => _PopUpMenuButtonState();
}

class _PopUpMenuButtonState extends State<PopUpMenuButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ColorChanger>(
      builder: (context, colorChanger, child) {
        Color mainColor = colorChanger.mainColor,
            secondColor = colorChanger.secondColor,
            thirdColor = colorChanger.thirdColor;
        return PopupMenuButton(
          elevation: 0,
          padding: EdgeInsets.zero,
          color: mainColor.withOpacity(0),
          icon: Icon(
            Icons.more_horiz,
            color: thirdColor,
            size: 40,
          ),
          onSelected: (value) {
            if (value == 1) {
              showModalBottomSheet(
                backgroundColor: secondColor.withOpacity(0),
                context: (context),
                builder: (context) => InfoPage(widget.folderName),
              );
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 1,
              child: MyPopupMenuItem(
                Icons.info_rounded,
                "تفاصيل الملف",
              ),
            ),
            PopupMenuItem(
              value: 2,
              child: MyPopupMenuItem(
                Icons.share_rounded,
                "مشاركة الملف",
              ),
            ),
            PopupMenuItem(
              value: 3,
              child: MyPopupMenuItem(
                Icons.delete_rounded,
                "حذف الملف",
              ),
            ),
            PopupMenuItem(
              value: 4,
              child: MyPopupMenuItem(
                Icons.drive_file_rename_outline,
                "إعادة التسمية",
              ),
            ),
            PopupMenuItem(
              value: 5,
              child: MyPopupMenuItem(
                Icons.lock_rounded,
                "غلق الملف",
              ),
            ),
            PopupMenuItem(
              value: 6,
              child: MyPopupMenuItem(
                Icons.push_pin_rounded,
                "تثبيت الملف",
              ),
            ),
          ],
        );
      },
    );
  }
}
