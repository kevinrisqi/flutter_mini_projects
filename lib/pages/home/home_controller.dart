import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../services/base.dart';
import '../../services/interceptor.dart';

class HomeController extends GetxController {
  void initServer() {
    BaseOptions options = BaseOptions(baseUrl: baseUrl);
    dio = Dio(options);
    dio.interceptors.add(ApiInterceptor());
    log('Success activated interceptor');
  }

  @override
  void onInit() {
    initServer();
    super.onInit();
  }
}
