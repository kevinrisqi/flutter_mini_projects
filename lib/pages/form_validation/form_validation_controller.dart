import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class FormValidationController extends GetxController {
  var firstNameController = TextEditingController();

  void clear() {
    firstNameController.text = '';
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
