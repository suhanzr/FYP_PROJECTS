import 'package:cosmetic_app/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <CartItem>[
    CartItem(
        name: "Mac Studio Foundation",
        price: 47.00,
        image: "assets/recommended/foundation.png",
        quantity: 1),
    CartItem(
        name: "Blush Stick - Makeup by Mario",
        price: 32.00,
        image: "assets/new_arrivals/blush_stick.png",
        quantity: 1),
    CartItem(
        name: "Eyeshadow Palette by Anastasia",
        price: 33.00,
        image: "assets/Sale Product/eye palette.png",
        quantity: 1),
  ].obs;

  var promoCode = "".obs;
  double get subtotal => cartItems.fold(
      0, (sum, item) => sum + (item.price * item.quantity.value));
  double get tax => 5.00;
  double get total => subtotal + tax;

  void increaseQuantity(int index) {
    cartItems[index].quantity++;
    cartItems.refresh();
  }

  void decreaseQuantity(int index) {
    if (cartItems[index].quantity > 1) {
      cartItems[index].quantity--;
      cartItems.refresh();
    }
  }

  void applyPromoCode(String code) {
    promoCode.value = code;
    Get.snackbar("Promo Code", "Promo code applied successfully!",
        backgroundColor: Colors.green, colorText: Colors.white);
  }
}
