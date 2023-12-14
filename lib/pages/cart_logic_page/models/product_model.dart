// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_mini_projects/pages/cart_logic_page/models/category_model.dart';

class ProductModel {
  String? name;
  String? description;
  String? type;
  CategoryModel? category;
  int? stock;
  double? price;
  String? image;
  
  ProductModel({
    this.name,
    this.description,
    this.type,
    this.category,
    this.stock,
    this.price,
    this.image,
  });
}
