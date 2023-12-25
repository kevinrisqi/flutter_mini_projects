import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mini_projects/global/controller/global_controller.dart';
import 'package:get/get.dart';

class FormValidationController extends GetxController {
  final c = Get.put(GlobalController());
  RxBool isLoading = false.obs;
  int currentIndex = 0;
  List<Map<String, String>> listParticipant = [];
  var nameTextControllerList = [];
  var emailTextControllerList = [];
  var resultTextController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  late GlobalKey<FormState> formKeyLate;

  Future<void> handleSubmit() async {
    if (formKey.currentState!.validate()) {
      log('message');
      isLoading.toggle();
      await Future.delayed(const Duration(seconds: 3));
      isLoading.toggle();
    }
  }

  void addParticipant() {
    nameTextControllerList.add(TextEditingController());
    emailTextControllerList.add(TextEditingController());
    log('Name Controller List: ${nameTextControllerList.length}');
    update();
  }

  void removeParticipant(int index) {
    nameTextControllerList.removeAt(index);
    emailTextControllerList.removeAt(index);
    update();
  }

  void saveParticipant() async {
    // log('Name List: ${nameTextControllerList.map((e) => e.text)}');
    // log('Email List: ${emailTextControllerList.map((e) => e.text)}');
    listParticipant.clear();
    for (int i = 0; i < nameTextControllerList.length; i++) {
      Map<String, String> map = {
        'name': nameTextControllerList[i].text,
        'email': emailTextControllerList[i].text,
      };
      log('Name: ${nameTextControllerList[i].text}');
      log('Map: $map');
      listParticipant.add(map);
      // await Future.delayed(Duration(seconds: 1));
    }
    log('List Participant: $listParticipant');
    resultTextController.text = '';
    resultTextController.text = listParticipant.toString();
    // resultTextController.text = '${nameTextControllerList.map((e) => e.text)} || ${emailTextControllerList.map((e) => e.text)}';
    Get.back();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
