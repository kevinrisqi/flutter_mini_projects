import 'package:dio/dio.dart';

const String baseUrl = 'https://reqres.in';
BaseOptions options = BaseOptions(baseUrl: baseUrl);
Dio dio = Dio();

var prefBox;
