import 'package:cosmetic_app/models/order_history_model.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  var orders = <Order>[].obs; // Observable list of orders

  @override
  void onInit() {
    super.onInit();
    fetchOrders();
  }

  void fetchOrders() {
    orders.value = [
      Order(
        name: "Mac Studio Foundation",
        price: "\$47.00",
        date: "Oct20, 2023",
        status: "In-Process",
        image: "assets/recommended/foundation.png",
      ),
      Order(
        name: "Blush Stick - Makeup by Mario",
        price: "\$32.00",
        date: "Oct20, 2023",
        status: "In-Process",
        image: "assets/new_arrivals/blush_stick.png",
      ),
      Order(
        name: "Eyeshadow Palette by Anastasia",
        price: "\$33.00",
        date: "Oct20, 2023",
        status: "In-Process",
        image: "assets/Sale Product/eye palette.png",
      ),
      Order(
        name: "Latafa Perfume",
        price: "\$75.00",
        date: "June07, 2023",
        status: "Delivered",
        image: "assets/recommended/latafa frafrance.png",
      ),
      Order(
        name: "Conditioner by The Body Shop",
        price: "\$30.00",
        date: "June02, 2023",
        status: "Cancelled",
        image: "assets/new_arrivals/conditioner.png",
      ),
      Order(
        name: "Hair Oil by Ouai",
        price: "\$58.00",
        date: "May20, 2023",
        status: "Delivered",
        image: "assets/recommended/hair oil.png",
      ),
    ];
  }
}
