import 'dart:developer';

import 'package:get/get_state_manager/get_state_manager.dart';

class TimelineTileController extends GetxController {
  var listLevel = [
    {
      "id": 1,
      "level": 2,
      "nama": "Level 1",
      "min_ion": 0,
      "max_ion": 10000,
      "is_max_level": 0,
      "has_achiev": true
    },
    {
      "id": 3,
      "level": 3,
      "nama": "Level 2",
      "min_ion": 10001,
      "max_ion": 20000,
      "is_max_level": 0,
      "has_achiev": true
    },
    {
      "id": 4,
      "level": 4,
      "nama": "Level 3",
      "min_ion": 20001,
      "max_ion": 40000,
      "is_max_level": 0,
      "has_achiev": true
    },
    {
      "id": 5,
      "level": 5,
      "nama": "Level 4",
      "min_ion": 40001,
      "max_ion": 50000,
      "is_max_level": 0,
      "has_achiev": false
    }
  ];

  @override
  void onInit() {
    log('Timeline Tile Controller Init');
    super.onInit();
  }
}
