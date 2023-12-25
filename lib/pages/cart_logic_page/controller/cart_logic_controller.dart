import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mini_projects/pages/cart_logic_page/models/category_model.dart';
import 'package:flutter_mini_projects/pages/cart_logic_page/models/product_model.dart';
import 'package:flutter_mini_projects/pages/cart_logic_page/repository/cart_logic_repository.dart';
import 'package:get/get.dart';

class CartLogicController extends GetxController
    with GetTickerProviderStateMixin {
  final _repo = CartLogicRepository();

  var searchC = TextEditingController();

  late TabController tabController;
  late TabController tabSizeC;

  int currIndex = 0;
  int currSizeIndex = 0;
  int qty = 1;

  List<String> listSize = [
    'S',
    'M',
    'L',
  ];

  List<CategoryModel> listCategory = [
    CategoryModel(name: 'Fast Food'),
    CategoryModel(name: 'Snacks'),
    CategoryModel(name: 'Drinks'),
    CategoryModel(name: 'Deserts'),
  ];

  List<ProductModel>? listProduct;

  List<ProductModel> listCart = [];

  double selectedPrice = 0;

  Rx<double> grandTotal = 0.0.obs;

  void incrementQty(double price) {
    qty++;
    selectedPrice = price * qty;
    log('Price: $selectedPrice');
    update();
  }

  void decrementQty(double price) {
    if (qty > 1) {
      qty--;
      selectedPrice = price * qty;
      log('Price: $selectedPrice');
      update();
    }
  }

  void getProduct() async {
    try {
      final res = await _repo.fetchProduct();
      log('Res: $res');
      listProduct = res;
      update();
    } catch (e) {
      log('Error trying to get Product $e');
    }
  }

  /// ****************** Cart ***************** ///

  void addCard(ProductModel product) {
    bool found = false;

    for (var item in listCart) {
      if (item.id == product.id) {
        found = true;
        item.quantity++;
        break;
      }
    }

    if (!found) {
      listCart.add(product);
    }

    for (var item in listCart) {
      log('Product Name: ${item.title} || Quantity: ${item.quantity}');
    }
    log('=============================');
    log('Cart Length: ${listCart.length}');
  }

  void checkCart() {
    for (var item in listCart) {
      log('Product Name: ${item.title} || Quantity: ${item.quantity}');
    }
    log('=============================');
    log('Cart Length: ${listCart.length}');
  }

  void addQtyCart(ProductModel product) {
    product.quantity++;
    calculateGrandTotal();
  }

  void minQtyCart(ProductModel product) {
    if (product.quantity > 1) {
      product.quantity--;
      calculateGrandTotal();
    }
  }

  void calculateGrandTotal() {
    grandTotal.value =
        listCart.fold(0, (p, e) => p + (e.quantity * e.price!).toInt());
    update();
  }

  @override
  void onInit() {
    tabController = TabController(length: listCategory.length, vsync: this)
      ..addListener(() {
        currIndex = tabController.index;
        update();
      });

    tabSizeC = TabController(length: listSize.length, vsync: this)
      ..addListener(() {
        currSizeIndex = tabSizeC.index;
        update();
      });
    super.onInit();
  }

  @override
  void onReady() {
    getProduct();

    super.onReady();
  }
}
