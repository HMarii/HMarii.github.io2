import 'package:fitness/constants/app_constants.dart';
import 'package:flutter/material.dart';

class RightBar extends StatelessWidget {
  final double barWidth;

  
  const RightBar({Key? key, required this.barWidth}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: rightBarPos,
      children: [
        Container (
        height: barHeight,
        width: barWidth,
        decoration: BoxDecoration(
          borderRadius: rightBarBorderRadius,
          color: secondHexColor
        ),
        ),
      ],
    );
  }
}