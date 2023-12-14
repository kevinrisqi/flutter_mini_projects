import 'package:flutter_mini_projects/global/controller/global_controller.dart';
import 'package:flutter_mini_projects/pages/agora_video_call/agora_video_call_controller.dart';
import 'package:flutter_mini_projects/pages/cart_logic_page/controller/cart_logic_controller.dart';
import 'package:flutter_mini_projects/pages/cloud_firestore/cloud_firestore_controller.dart';
import 'package:flutter_mini_projects/pages/countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_mini_projects/pages/expansion_tile/expansion_tile_controller.dart';
import 'package:flutter_mini_projects/pages/form_validation/form_validation_controller.dart';
import 'package:flutter_mini_projects/pages/handle_permission/handle_permission_controller.dart';
import 'package:flutter_mini_projects/pages/home/home_controller.dart';
import 'package:flutter_mini_projects/pages/no_connection/no_connection_controller.dart';
import 'package:flutter_mini_projects/pages/routing_page/routing_page_controller.dart';
import 'package:flutter_mini_projects/pages/scrollable_list/scrollable_list_controller.dart';
import 'package:flutter_mini_projects/pages/text_recognize/text_recognize_controller.dart';
import 'package:flutter_mini_projects/pages/timeline_tile/timeline_tile_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(GlobalController());
  }
}

class FormValidationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FormValidationController());
  }
}

class NoConnectionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NoConnectionController());
  }
}

class HandlePermissionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HandlePermissionController());
  }
}

class ScrollableListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScrollableListController());
  }
}

class CountdownTimerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CountDownController());
  }
}

class ExpansionTileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExpansionTileController());
  }
}

class AgoraVideoCallBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AgoraVideoCallController());
  }
}

class TimelineTileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TimelineTileController());
  }
}

class CloudFirestoreBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CloudFirestoreController());
  }
}
class TextRecognizeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TextRecognizeController());
  }
}
class RoutingPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RoutingPageController());
  }
}
class CartLogicBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartLogicController());
  }
}
