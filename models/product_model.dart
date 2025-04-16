import 'package:get/get.dart';
class Product {
  final String name;
  final String brand;
  final double price;
  final String image;
  final String category;
  final String subCategory;
  RxInt quantity = 0.obs;
  RxBool isFavourites = false.obs;
  final double? discount;

  Product({
    required this.name,
    required this.brand,
    required this.price,
    required this.image,
    required this.category,
    required this.subCategory,
    this.discount,
  });
}
