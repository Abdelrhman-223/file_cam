import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:filecam/colors.dart';

//----------IMPORTANT----------
// This page for the sub folder card icon, it's contain the structure of the icon.

// ignore: must_be_immutable
class CardImage extends StatefulWidget {
  double alignmentValue, opacityValue;

  CardImage(this.alignmentValue, this.opacityValue, {super.key});

  @override
  State<CardImage> createState() => _CardImageState();
}

class _CardImageState extends State<CardImage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ColorChanger>(
      builder: (context, colorChanger, child) {
        Color secondColor = colorChanger.secondColor;
        return Align(
          alignment: Alignment(widget.alignmentValue, widget.alignmentValue),
          child: Container(
            height: 100,
            width: 100,
            color: secondColor.withOpacity(widget.opacityValue),
          ),
        );
      },
    );
  }
}
