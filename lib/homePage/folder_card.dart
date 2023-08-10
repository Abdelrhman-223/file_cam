import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:filecam/colors.dart';
import 'package:filecam/homePage/shadow_line.dart';
import 'package:filecam/photoPages/gallery_page.dart';
import 'package:filecam/popupMenu/pop_up_menu_button.dart';

// ignore: must_be_immutable
class FolderCard extends StatefulWidget {
  bool pined, locked;
  String folderName, firstImageName, secondImageName, thirdImageName;

  FolderCard(this.folderName, this.firstImageName, this.secondImageName,
      this.thirdImageName, this.locked, this.pined,
      {super.key});

  @override
  State<FolderCard> createState() => _FolderCardState();
}

class _FolderCardState extends State<FolderCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ColorChanger>(
      builder: (context, colorChanger, child) {
        Color mainColor = colorChanger.mainColor,
            secondColor = colorChanger.secondColor,
            thirdColor = colorChanger.thirdColor;
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => GalleryPage(widget.folderName)),
            );
          },
          child: Container(
            height: 175,
            margin: const EdgeInsets.symmetric(vertical: 17.5),
            decoration: BoxDecoration(
              color: secondColor,
              borderRadius: BorderRadius.circular(25),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black87,
                  blurRadius: 7,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 15, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.folderName,
                        style: TextStyle(
                          color: thirdColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            child: Icon(
                              Icons.lock_rounded,
                              color: (widget.locked) ? mainColor : thirdColor,
                              size: 20,
                            ),
                          ),
                          GestureDetector(
                            child: Icon(
                              Icons.push_pin,
                              color: (widget.pined) ? mainColor : thirdColor,
                              size: 20,
                            ),
                          ),
                          PopUpMenuButton(widget.folderName),
                        ],
                      ),
                    ],
                  ),
                ),
                const ShadowLine(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      widget.firstImageName,
                      width: 100,
                    ),
                    Image.asset(
                      widget.secondImageName,
                      width: 100,
                    ),
                    Image.asset(
                      widget.thirdImageName,
                      width: 100,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
