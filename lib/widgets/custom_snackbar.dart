import 'package:flutter/material.dart';
import 'package:flutter_mini_projects/properties/size.dart';
import 'package:flutter_mini_projects/widgets/custom_text.dart';
import 'package:get/get.dart';

customSnackBar(String message, {bool isSuccess = true}) {
  return Get.rawSnackbar(
    backgroundColor: isSuccess ? Colors.green : Colors.red,
    borderRadius: 10,
    padding: const EdgeInsets.all(14),
    margin: const EdgeInsets.symmetric(horizontal: 8),
    snackStyle: SnackStyle.FLOATING,
    messageText: customText(message, color: Colors.white, fontSize: FontSize.s16),
  );
}
