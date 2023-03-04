import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mini_projects/properties/size.dart';
import 'package:flutter_mini_projects/widgets/custom_appbar.dart';
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
                log('List pressed');
              },
              title: customText(
                'Access permission to get contact',
                fontWeight: FontWeight.w500,
                fontSize: Sizes.s15,
              ),
              trailing: Icon(
                (c.hasPermissionContact ?? false) ? Icons.check_box : Icons.check,
                color: Colors.green,
              ),
            ),
          ],
        ),
      );
    });
  }
}
