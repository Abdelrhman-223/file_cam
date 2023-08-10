import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:filecam/colors.dart';

/*
class BarButton extends StatelessWidget {
  IconData iconName;
  int index;
  BarButton(this.iconName, this.index);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        pageIndex = index;
      },
      child: Container(
        decoration: BoxDecoration(
            color: thirdColor,
            border: Border.all(
              color: secondColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(7.5)
        ),
        padding: EdgeInsets.all(2.5),
        child: Icon(
          iconName,
          color: secondColor,
          size: 30,
        ),
      ),
    );
  }
}
*/

// ignore: must_be_immutable
class BarButton extends StatefulWidget {
  IconData iconName;
  int index;

  BarButton(this.iconName, this.index, {super.key});

  @override
  BarButtonState createState() => BarButtonState();
}

class BarButtonState extends State<BarButton> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ColorChanger(),
      child: Consumer<ColorChanger>(
        builder: (context, colorChanger, child) {
          Color secondColor = colorChanger.secondColor,
              thirdColor = colorChanger.thirdColor;
          return GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  color: thirdColor,
                  border: Border.all(
                    color: secondColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(7.5)),
              padding: const EdgeInsets.all(2.5),
              child: Icon(
                widget.iconName,
                color: secondColor,
                size: 30,
              ),
            ),
          );
        },
      ),
    );
  }
}
