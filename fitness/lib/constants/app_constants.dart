import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:hexcolor/hexcolor.dart' show HexColor;

final Color mainHexColor = HexColor("#1C1C1C");
final Color secondHexColor = HexColor("#FCC91C");
final colorRed = Colors.red[400];
const colorYellow = Colors.yellow;
final Color colorGrey =  HexColor("#303030");
final Color colorLightGrey = HexColor("#D0D0D0");
final colorWhiteOpacity = Colors.white.withOpacity(0.8);
final colorGreen = Colors.green[400];
const leftBarPos = MainAxisAlignment.end;
const rightBarPos = MainAxisAlignment.start;
const barHeight = 25.0;

const rightBarBorderRadius = BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          );
const leftBarBorderRadius = BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          );