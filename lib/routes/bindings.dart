import 'package:flutter_mini_projects/pages/form_validation/form_validation_controller.dart';
import 'package:get/get.dart';

class FormValidationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FormValidationController());
  }
}
