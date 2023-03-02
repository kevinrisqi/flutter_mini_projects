import 'package:flutter_mini_projects/global/controller/global_controller.dart';
import 'package:flutter_mini_projects/pages/form_validation/form_validation_controller.dart';
import 'package:flutter_mini_projects/pages/handle_permission/handle_permission_controller.dart';
import 'package:flutter_mini_projects/pages/home/home_controller.dart';
import 'package:flutter_mini_projects/pages/no_connection/no_connection_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(GlobalController());
  }
}

class FormValidationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FormValidationController());
  }
}

class NoConnectionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NoConnectionController());
  }
}
class HandlePermissionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HandlePermissionController());
  }
}
