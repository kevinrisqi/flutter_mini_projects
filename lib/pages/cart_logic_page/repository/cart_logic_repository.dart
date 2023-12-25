import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_mini_projects/pages/cart_logic_page/helpers/cart_logic_api_const.dart';
import 'package:flutter_mini_projects/pages/cart_logic_page/models/product_model.dart';

class CartLogicRepository {
  final _apiConst = CartLogicApiConst();

  Future<List<ProductModel>> fetchProduct() async {
    try {
      final res = await Dio().get(_apiConst.getProduct);
      // print('Res: ${res.data}');
      return productModelFromJson(jsonEncode(res.data));
    } on DioError catch (e) {
      if (e.response == null) {
        throw e.message ?? 'Unknow Error';
      }
      throw e.message ?? '';
    }
  }
}
