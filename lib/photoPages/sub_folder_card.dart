import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:filecam/colors.dart';
import 'package:filecam/photoPages/card_images.dart';

// ignore: must_be_immutable
class SubFolderCard extends StatefulWidget {
  String subFolderName;

  SubFolderCard(this.subFolderName, {super.key});

  @override
  State<SubFolderCard> createState() => _SubFolderCardState();
}

class _SubFolderCardState extends State<SubFolderCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ColorChanger>(
      builder: (context, colorChanger, child) {
        Color secondColor = colorChanger.secondColor;
        return GestureDetector(
          child: Column(
            children: [
              Container(
                width: 120,
                height: 120,
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    CardImage(-1, 0.2),
                    CardImage(-0.50, 0.4),
                    CardImage(0, 0.6),
                    CardImage(0.50, 0.8),
                    CardImage(1, 1),
                  ],
                ),
              ),
              Text(
                widget.subFolderName,
                style: TextStyle(
                  color: secondColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
