import 'package:flutter/material.dart';

Widget customText({
  String? title,
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
  TextAlign? textAlign,
}) {
  return Text(
    title ?? '',
    textAlign: textAlign,
    style: TextStyle(
      fontSize: fontSize ?? 14,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? Colors.black,
    ),
  );
}
