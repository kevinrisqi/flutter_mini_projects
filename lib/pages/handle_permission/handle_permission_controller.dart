import 'dart:developer';

import 'package:flutter_mini_projects/services/base.dart';
import 'package:flutter_mini_projects/services/data_store_service.dart';
import 'package:get/get.dart';

class HandlePermissionController extends GetxController {
  bool? hasPermissionContact;

  @override
  void onInit() async {
    log('Handle Permission Init');
    await DataStoreService.setPermissionContact();
    hasPermissionContact = await DataStoreService.hasPermissionContact;
    update();
    super.onInit();
  }
}
