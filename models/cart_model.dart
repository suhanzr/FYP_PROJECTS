import 'package:get/get.dart';

class CartItem {
  String name;
  double price;
  String image;
  RxInt quantity;

  CartItem({
    required this.name,
    required this.price,
    required this.image,
    required int quantity,
  }) : quantity = quantity.obs;
}
