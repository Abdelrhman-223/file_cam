import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:filecam/colors.dart';
import 'package:filecam/homePage/button.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, 0.8),
      child: Consumer<ColorChanger>(
        builder: (context, colorChanger, child) {
          Color mainColor = colorChanger.mainColor,
              secondColor = colorChanger.secondColor;
          return Container(
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
                  child: Button(Icons.add_photo_alternate_rounded, false),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {});
                  },
                  child: Button(Icons.video_call_rounded, false),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {});
                  },
                  child: Button(Icons.note_add_rounded, false),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
