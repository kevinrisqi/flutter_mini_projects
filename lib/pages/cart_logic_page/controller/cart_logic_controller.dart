import 'package:flutter/material.dart';
import 'package:flutter_mini_projects/pages/cart_logic_page/helpers/cart_logic_assets.const.dart';
import 'package:flutter_mini_projects/pages/cart_logic_page/models/category_model.dart';
import 'package:flutter_mini_projects/pages/cart_logic_page/models/product_model.dart';
import 'package:get/get.dart';

class CartLogicController extends GetxController
    with GetTickerProviderStateMixin {
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

  List<ProductModel> listProduct = [
    ProductModel(
      name: 'Burger',
      type: 'Food',
      image: CartLogicAsseetsConst.icBurger,
      stock: 10,
      price: 13000,
      description: 'Double Beef Yummy !!!',
      category: CategoryModel(name: 'Fast Food'),
    ),
    ProductModel(
      name: 'Hotdog',
      type: 'Food',
      image: CartLogicAsseetsConst.icHotdog,
      stock: 3,
      price: 15000,
      description: 'Buy 1 Get 1 !!!',
      category: CategoryModel(name: 'Fast Food'),
    ),
    ProductModel(
      name: 'Pizza',
      type: 'Food',
      image: CartLogicAsseetsConst.icPizza,
      stock: 14,
      price: 25000,
      description: 'Get 9 Slice !!!',
      category: CategoryModel(name: 'Fast Food'),
    ),
    ProductModel(
      name: 'Komo',
      type: 'Food',
      image: null,
      stock: 12,
      price: 1000,
      description: 'Crunchy !!!',
      category: CategoryModel(name: 'Snacks'),
    ),
  ];

  void incrementQty() {
    qty++;
    update();
  }

  void decrementQty() {
    if (qty > 1) {
      qty--;
      update();
    }
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
}
