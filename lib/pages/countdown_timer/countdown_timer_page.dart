import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:flutter_mini_projects/pages/countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_mini_projects/properties/size.dart';
import 'package:flutter_mini_projects/widgets/custom_text.dart';
import 'package:get/get.dart';

class CountdownTimerPage extends StatelessWidget {
  const CountdownTimerPage({super.key});

  // final c = Get.find<CountDownController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customText(
          'Countdown Timer',
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: FontSize.s18,
        ),
      ),
      body: GetBuilder<CountDownController>(builder: (c) {
        return Column(
          children: [
            SizedBox(
              height: padding * 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CountdownTimer(
                  controller: c.controller,
                  onEnd: c.onEnd,
                  endTime: c.endTime,
                ),
              ],
            ),
          ],
        );
      }),
      floatingActionButton: GetBuilder<CountDownController>(
        builder: (c) {
          // return customAnimatedFAB(c);
          return Obx(
            () => InkWell(
              onTap: () {
                c.isExpanded.toggle();
                if (c.isExpanded.value) {
                  c.size.value = 100.0;
                } else {
                  c.size.value = 64.0;
                }
              },
              child: AnimatedContainer(
                  width: c.size.value,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blue,
                  ),
                  duration: const Duration(milliseconds: 500),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                      ),
                      if (c.isExpanded.value)
                        customText('Play', color: Colors.white)
                    ],
                  )),
            ),
          );
        },
      ),
    );
  }

  Widget customAnimatedFAB(CountDownController c) {
    return AnimatedBuilder(
      animation: c.animationController,
      builder: (context, child) {
        return Transform.rotate(
          angle: c.animationController.value * 180,
          child: child,
        );
      },
      child: FloatingActionButton.extended(
        onPressed: () {},
        label: Row(
          children: [
            customText(
              'Play',
              fontWeight: FontWeight.w600,
              fontSize: FontSize.s18,
              color: Colors.white,
            ),
            const Icon(Icons.play_arrow),
          ],
        ),
      ),
    );
  }
}
