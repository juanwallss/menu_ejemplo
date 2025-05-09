import 'package:flutter/material.dart';

mixin FoodText {
  Widget getFoodText(String text,
      {double fontSize = 17,
      Color colorText = Colors.black,
      FontWeight fontWeight = FontWeight.normal}) {
    return Text(
      text,
      style: TextStyle(
          color: colorText,
          fontFamily: 'Montserrat',
          fontWeight: fontWeight,
          fontSize: fontSize),
    );
  }
}
