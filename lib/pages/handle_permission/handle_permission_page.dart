import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mini_projects/properties/color.dart';
import 'package:flutter_mini_projects/properties/size.dart';
import 'package:flutter_mini_projects/widgets/custom_appbar.dart';
import 'package:flutter_mini_projects/widgets/custom_snackbar.dart';
import 'package:flutter_mini_projects/widgets/custom_text.dart';
import 'package:get/get.dart';

import 'handle_permission_controller.dart';

class HandlePermissionPage extends StatelessWidget {
  const HandlePermissionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HandlePermissionController>(builder: (c) {
      return Scaffold(
        appBar: customAppBar('Handle Permission'),
        body: ListView(
          padding: EdgeInsets.symmetric(vertical: padding),
          children: [
            ListTile(
              onTap: () {
                // log('Permission Contact: ${c.hasPermissionContact}');
                // c.changePermissionContact();
                c.getContact();
              },
              title: customText(
                'Access Contact',
                fontWeight: FontWeight.w500,
                fontSize: Sizes.s15,
              ),
              trailing: Icon(
                (c.hasPermissionContact ?? false)
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
                color: primaryColor,
              ),
            ),
            ListTile(
              onTap: () {
                // c.getPermissionContact();
              },
              title: customText(
                'Access Storage & Photos',
                fontWeight: FontWeight.w500,
                fontSize: Sizes.s15,
              ),
              trailing: Icon(
                (c.hasPermissionPhotos ?? false)
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
                color: primaryColor,
              ),
            ),
            ListTile(
              onTap: () {
                c.getFiles();
              },
              title: customText(
                'Access Storage',
                fontWeight: FontWeight.w500,
                fontSize: Sizes.s15,
              ),
              trailing: Icon(
                (c.hasPermissionPhotos ?? false)
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
                color: primaryColor,
              ),
            ),
          ],
        ),
      );
    });
  }
}
