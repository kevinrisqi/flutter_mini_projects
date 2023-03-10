import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mini_projects/services/base.dart';
import 'package:flutter_mini_projects/services/data_store_service.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class HandlePermissionController extends GetxController {
  bool? hasPermissionContact;

  Future<void> changePermissionContact() async {
    hasPermissionContact = !hasPermissionContact!;
    await DataStoreService.setPermissionContact(value: hasPermissionContact!);
    update();
  }

  Future<void> getPermissionContact() async {
    var status = await Permission.contacts.status;
    log('Status: $status');
    if (status.isDenied) {
      // We didn't ask for permission yet or the permission has been denied before but not permanently.
      if (await Permission.contacts.request().isGranted) {
        // Either the permission was already granted before or the user just granted it.
      }
    }
  }

  @override
  void onInit() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      hasPermissionContact = await DataStoreService.hasPermissionContact;
      log('Has Permission Contact: $hasPermissionContact');
      update();
    });
    log('Handle Permission Init');

    super.onInit();
  }
}
