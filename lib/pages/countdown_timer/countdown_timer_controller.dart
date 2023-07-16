import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:get/get.dart';

class CountDownController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late CountdownTimerController controller;
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;
  late AnimationController animationController;

  var isExpanded = false.obs;

  var size = 30.0.obs;

  void onEnd() {
    print('onEnd');
  }

  void startTimer() {
    log('Start Timer');
    endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60;
    controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
    update();
    // controller.start();
  }

  @override
  void onInit() {
    log('Countdown Timer Init');
    controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    super.onInit();
  }

  @override
  void dispose() {
    log('Countdown Timer Dispose');
    controller.disposeTimer();
    animationController.dispose();
    super.dispose();
  }
}
