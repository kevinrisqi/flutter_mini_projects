import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mini_projects/widgets/custom_appbar.dart';
import 'package:get/get.dart';

import 'handle_permission_controller.dart';

class HandlePermissionPage extends StatelessWidget {
  const HandlePermissionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HandlePermissionController>(
      builder: (c) {
        return Scaffold(
          appBar: customAppBar('Handle Permission'),
          body: ListView(
            children: [
              Checkbox(value: true, onChanged: (value){})
            ],
          ),
        );
      }
    );
  }
}
