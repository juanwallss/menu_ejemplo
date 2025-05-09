import 'package:flutter/material.dart';

mixin CustomText {
  Widget getHeaderText({
    required String text,
    FontWeight fontWeight = FontWeight.normal,
    double? fontSize = 25,
  }) => Text(
    text,
    style: TextStyle(
      color: Colors.white,
      fontFamily: 'Montserrat',
      fontWeight: fontWeight,
      fontSize: fontSize,
    ),
  );

  Widget getBodyText({
    required String text,
    FontWeight fontWeight = FontWeight.normal,
    double fontSize = 22,
    Color colorText = Colors.black,
  }) => Text(
    text,
    style: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: colorText,
    ),
  );
}
