import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ScrollableListController extends GetxController {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  ScrollController scrollController = ScrollController();

  var height = 0.0.obs;

  var keys = [];

  void scrollJumpTo(int index) {
    itemScrollController.scrollTo(
      index: index,
      duration: Duration(seconds: 2),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  void onInit() {
    itemPositionsListener.itemPositions
        .addListener(() => log("I'm in position"));
    super.onInit();
  }
}
