import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:filecam/colors.dart';
import 'package:filecam/popupMenu/sort_menu_item.dart';

class SortMenuButton extends StatefulWidget {
  const SortMenuButton({super.key});

  @override
  State<SortMenuButton> createState() => _SortMenuButtonState();
}

class _SortMenuButtonState extends State<SortMenuButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ColorChanger>(
      builder: (context, colorChanger, child) {
        Color mainColor = colorChanger.mainColor,
            thirdColor = colorChanger.thirdColor;
        return PopupMenuButton(
          elevation: 0,
          padding: EdgeInsets.zero,
          color: mainColor.withOpacity(0),
          icon: Icon(
            Icons.sort_rounded,
            color: thirdColor,
          ),
          itemBuilder: (context) => [
            PopupMenuItem(
              child: SortMenuItem(
                "حسب الإسم",
              ),
            ),
            PopupMenuItem(
              child: SortMenuItem(
                "حسب النوع",
              ),
            ),
            PopupMenuItem(
              child: SortMenuItem(
                "حسب التاريخ",
              ),
            ),
            PopupMenuItem(
              child: SortMenuItem(
                "حسب الحجم",
              ),
            ),
          ],
        );
      },
    );
  }
}
