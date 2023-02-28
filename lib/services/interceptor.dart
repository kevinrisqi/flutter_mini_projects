import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_mini_projects/pages/no_connection/no_connection_page.dart';
import 'package:flutter_mini_projects/services/internet_services.dart';
import 'package:get/route_manager.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    log('REQUEST');
    var isConnected = await checkConnection();
    log('Is Connected: $isConnected');
    if (!isConnected) return Get.off(() => const NoConnectionPage());
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('RESPONSE URL: ${response.realUri}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log('ERROR URL: ${err.response?.realUri}');
    log('ERROR CODE: ${err.response?.statusCode}');
    log('ERROR RESPONSE: ${err.response?.data}');
    super.onError(err, handler);
  }
}
