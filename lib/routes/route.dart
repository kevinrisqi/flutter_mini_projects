import 'package:flutter_mini_projects/pages/home/home_page.dart';
import 'package:flutter_mini_projects/routes/route_name.dart';
import 'package:get/get.dart';

List<GetPage> pages = [
  GetPage(
    name: RouteName.home,
    page: () => const HomePage(),
  )
];
