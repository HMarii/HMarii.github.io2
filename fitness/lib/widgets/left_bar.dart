import 'package:fitness/constants/app_constants.dart';
import 'package:flutter/material.dart';

class LeftBar extends StatelessWidget {
  final double barWidth;
  
  const LeftBar({Key? key, required this.barWidth}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: leftBarPos,
      children: [
        Container (
        height: barHeight,
        width: barWidth,
        decoration: BoxDecoration(
          borderRadius: leftBarBorderRadius,
          color: secondHexColor
        ),
        ),
      ],
    );
  }
}