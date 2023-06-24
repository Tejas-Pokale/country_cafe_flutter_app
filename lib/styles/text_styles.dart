import 'package:flutter/material.dart';

class Custom_TextStyle {
  Custom_TextStyle() {}

  static TextStyle styleWhite34({Color textColor = Colors.white , FontWeight fontWeight = FontWeight.bold , double fontSize = 34}) {
    return TextStyle(
      color: textColor,
      fontWeight: fontWeight,
      fontSize: fontSize,
    );
  }
}
