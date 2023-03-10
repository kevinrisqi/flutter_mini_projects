import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mini_projects/routes/route_name.dart';
import 'package:get/get.dart';

import '../../properties/color.dart';
import '../../properties/size.dart';
import '../../widgets/custom_list_tile.dart';
import '../../widgets/custom_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: foregroundColor,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        children: [
          customText('Welcome,\nKevin', fontSize: FontSize.s18),
          SizedBox(
            height: padding * 2,
          ),
          customListTile(
            title: 'Form Validation',
            subtitle: 'This is example to create form validation',
            ontap: () {
              log('Validation Form has Triggered');
              Get.toNamed(RouteName.formValidation);
            },
          ),
          customListTile(
            title: 'Handle No Connection',
            subtitle:
                'This method is used to handle applicaton when there is no connection internet',
            ontap: () {
              log('Handle no connection has triggered');
              Get.toNamed(RouteName.noConnection);
            },
          ),
          customListTile(
            title: 'Handle Permission',
            subtitle:
                'This method is used to handle permission to access location, contacts, etc',
            ontap: () {
              log('Handle permission has triggered');
              Get.toNamed(RouteName.handlePermission);
            },
          ),
          customListTile(
            title: 'Scrollable List',
            subtitle:
                'This method is used to going spesific index',
            ontap: () {
              log('Handle Scrollable has triggered');
              Get.toNamed(RouteName.scrollable);
            },
          ),
        ],
      ),
    );
  }
}
