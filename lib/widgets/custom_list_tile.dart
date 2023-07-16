import 'package:flutter/material.dart';
import 'package:flutter_mini_projects/properties/size.dart';

import '../properties/color.dart';
import 'custom_text.dart';

Widget customListTile(
    {String? title,
    String? subtitle,
    Function()? ontap,
    required Color tileColor}) {
  return Padding(
    padding: EdgeInsets.only(bottom: padding),
    child: Container(
      height: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          tileColor.withOpacity(0.2),
          tileColor.withOpacity(0.4),
          tileColor,
        ], begin: Alignment.centerLeft, end: Alignment.centerRight),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          VerticalDivider(
            color: tileColor,
            thickness: 2,
          ),
          Expanded(
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(
                  vertical: padding / 2, horizontal: padding),
              title: customText(title ?? '',
                  fontSize: 16, fontWeight: FontWeight.w600, color: textColor),
              subtitle: customText(
                subtitle ?? '',
                color: textColor,
              ),
              trailing: const Icon(Icons.chevron_right),
              // tileColor: tileColor ?? baseColor,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10),
              ),
              onTap: ontap,
            ),
          ),
        ],
      ),
    ),
  );
}
