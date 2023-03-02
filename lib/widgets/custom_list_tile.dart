import 'package:flutter/material.dart';
import 'package:flutter_mini_projects/properties/size.dart';

import '../properties/color.dart';
import 'custom_text.dart';

Widget customListTile({String? title, String? subtitle, Function()? ontap}) {
  return Padding(
    padding: EdgeInsets.only(bottom: padding),
    child: ListTile(
      contentPadding:
          EdgeInsets.symmetric(vertical: padding / 2, horizontal: padding),
      title: customText(title ?? '',
          fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
      subtitle: customText(
        subtitle ?? '',
        color: Colors.white,
      ),
      trailing: const Icon(Icons.chevron_right),
      tileColor: baseColor,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(10),
      ),
      onTap: ontap,
    ),
  );
}
