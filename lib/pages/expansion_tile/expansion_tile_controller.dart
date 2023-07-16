import 'dart:developer';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpansionTileController extends GetxController {
  List bikes = ['RC113V', 'YZF-M1', 'BMW S1000R', 'ZX10R'];

  @override
  void onInit() {
    log('Expansion Tile Controller Init');
    super.onInit();
  }
}
