import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:filecam/colors.dart';

class ShadowLine extends StatelessWidget {
  const ShadowLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorChanger>(
      builder: (context, colorChanger, child) {
        Color thirdColor = colorChanger.thirdColor;
        return Container(
          height: 0,
          margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            color: thirdColor,
            boxShadow: [
              BoxShadow(
                color: thirdColor,
                blurRadius: 2,
                offset: const Offset(0, 0),
                spreadRadius: 1,
              )
            ],
          ),
        );
      },
    );
  }
}
