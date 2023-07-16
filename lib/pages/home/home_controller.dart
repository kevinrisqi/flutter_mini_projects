import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../services/base.dart';
import '../../services/interceptor.dart';

class HomeController extends GetxController {
  void initServer() {
    BaseOptions options = BaseOptions(baseUrl: baseUrl);
    dio = Dio(options);
    dio.interceptors.add(ApiInterceptor());
    log('Success activated interceptor');
  }

  String getGreeting(String name) {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good Morning,\n$name';
    if (hour < 17) return 'Good Afternoon,\n$name';
    return 'Good Evening,\n$name';
  }

  String getDateTime() {
    var now = DateTime.now();
    var formatter = DateFormat('EEEE, MMMM dd, yyyy hh:mm');
    var result = formatter.format(now);
    return result;
  }

  @override
  void onInit() {
    initServer();
    super.onInit();
  }
}
