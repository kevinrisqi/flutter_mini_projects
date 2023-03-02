import 'dart:developer';

import 'package:flutter/material.dart';

import '../properties/color.dart';
import '../properties/size.dart';

AppBar customAppBar(String title,
    {Color? backgroundColor, bool? hasClear, Function()? actionTap}) {
  return AppBar(
    backgroundColor: backgroundColor ?? foregroundColor,
    title: Text(title),
    actions: [
      Visibility(
        visible: hasClear ?? false,
        child: InkWell(
          onTap: actionTap,
          child: Padding(
            padding: EdgeInsets.only(right: padding),
            child: const Icon(Icons.delete),
          ),
        ),
      )
    ],
  );
}
