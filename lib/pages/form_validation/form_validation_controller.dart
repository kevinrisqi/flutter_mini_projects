import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormValidationController extends GetxController {
  var firstNameController = TextEditingController();

  void clear() {
    firstNameController.text = '';
  }

}
