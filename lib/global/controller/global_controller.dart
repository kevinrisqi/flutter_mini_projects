import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class GlobalController extends GetxController {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();
}
