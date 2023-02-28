import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_mini_projects/services/base.dart';

class UsersServices {
  Future<dynamic> getAllUsers() async {
    try {
      final response = await dio.get('$baseUrl/api/users?page=2');
      // Map<String, dynamic> map = response.data;
      // print(response.data);
      log('success get api');
      return response.data;
    } on DioError catch (e) {
      log('failed to get api');
      if (e.type == DioErrorType.unknown) {
        throw e.response?.data['errors'];
      }
      throw e.message ?? '';
    }
  }
}
