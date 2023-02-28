import 'dart:developer';

import 'package:flutter_mini_projects/services/users_services.dart';
import 'package:get/get.dart';

class NoConnectionController extends GetxController {
  Map? dataUsers;

  Future<void> getUsers() async {
    try {
      dataUsers = await UsersServices().getAllUsers();
      log('${dataUsers?['data']}');
      update();
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void onInit() {
    log('No Connection Init');
    getUsers();
    super.onInit();
  }

  @override
  void dispose() {
    log('No Connection Dispose');
    super.dispose();
  }
}
