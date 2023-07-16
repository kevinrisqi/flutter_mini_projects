import 'package:flutter_mini_projects/pages/agora_video_call/agora_video_call.dart';
import 'package:flutter_mini_projects/pages/countdown_timer/countdown_timer_page.dart';
import 'package:flutter_mini_projects/pages/expansion_tile/expansion_tile_page.dart';
import 'package:flutter_mini_projects/pages/form_validation/form_validation_page.dart';
import 'package:flutter_mini_projects/pages/handle_permission/contact_page.dart';
import 'package:flutter_mini_projects/pages/handle_permission/handle_permission_page.dart';
import 'package:flutter_mini_projects/pages/home/home_page.dart';
import 'package:flutter_mini_projects/pages/no_connection/no_connection_main_page.dart';
import 'package:flutter_mini_projects/pages/scrollable_list/scrollable_list_page.dart';
import 'package:flutter_mini_projects/pages/timeline_tile/timeline_tile_page.dart';
import 'package:flutter_mini_projects/routes/bindings.dart';
import 'package:flutter_mini_projects/routes/route_name.dart';
import 'package:get/get.dart';

List<GetPage> pages = [
  GetPage(
    name: RouteName.home,
    page: () => const HomePage(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: RouteName.formValidation,
    page: () => const FormValidationPage(),
    binding: FormValidationBinding(),
  ),
  GetPage(
    name: RouteName.noConnection,
    page: () => const NoConnectionMainPage(),
    binding: NoConnectionBinding(),
  ),
  GetPage(
    name: RouteName.handlePermission,
    page: () => const HandlePermissionPage(),
    binding: HandlePermissionBinding(),
  ),
  GetPage(
    name: RouteName.scrollable,
    page: () => const ScrollableListPage(),
    binding: ScrollableListBinding(),
  ),
  GetPage(
    name: RouteName.countdown,
    page: () => const CountdownTimerPage(),
    binding: CountdownTimerBinding(),
  ),
  GetPage(
    name: RouteName.contact,
    page: () => const ContactPage(),
    // binding: CountdownTimerBinding(),
  ),
  GetPage(
    name: RouteName.expansion,
    page: () => const ExpansionTilePage(),
    binding: ExpansionTileBinding(),
  ),
  GetPage(
    name: RouteName.agoraVideoCall,
    page: () => const AgoraVideoCall(),
    binding: AgoraVideoCallBinding(),
  ),
  GetPage(
    name: RouteName.timeline,
    page: () => const TimelineTilePage(),
    binding: TimelineTileBinding(),
  ),
];
