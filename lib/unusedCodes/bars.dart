import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:filecam/colors.dart';
import 'package:filecam/unusedCodes/bar_buttons.dart';

class HomePageBars extends StatefulWidget {
  const HomePageBars({super.key});

  @override
  State<HomePageBars> createState() => _HomePageBarsState();
}

class _HomePageBarsState extends State<HomePageBars> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ColorChanger(),
      child: Consumer<ColorChanger>(
        builder: (context, colorChanger, child) {
          Color thirdColor = colorChanger.thirdColor;
          return Stack(
            children: [
              Align(
                alignment: const Alignment(0.8, 0),
                child: Container(
                  width: 60,
                  height: 275,
                  decoration: BoxDecoration(
                    color: thirdColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BarButton(Icons.home_filled, 0),
                      BarButton(Icons.settings, 1),
                      BarButton(Icons.bookmark, 2),
                      BarButton(Icons.delete, 3),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0, 0.8),
                child: Container(
                  width: 225,
                  height: 60,
                  decoration: BoxDecoration(
                    color: thirdColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BarButton(Icons.upload_file, 4),
                      BarButton(Icons.video_call_rounded, 5),
                      BarButton(Icons.add_photo_alternate_rounded, 6),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
