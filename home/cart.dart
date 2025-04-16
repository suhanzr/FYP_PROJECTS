import 'package:cosmetic_app/components/Button.dart';
import 'package:cosmetic_app/constant/constant.dart';
import 'package:cosmetic_app/controller/cart_controller/cart_controller.dart';
import 'package:cosmetic_app/models/cart_model.dart';
import 'package:cosmetic_app/screens/home/checkout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cart",
            style: TextStyle(
                fontFamily: 'Times New Roman Bold', color: Color(0xff212121))),
        backgroundColor: AppColors.background,
        surfaceTintColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image(
              image: AssetImage(
                'assets/cart.png',
              ),
              color: Color(0xff212121),
              // fit: BoxFit.cover,
              // width: 30,
              // height: 30,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: cartController.cartItems.length,
                  itemBuilder: (context, index) {
                    var item = cartController.cartItems[index];
                    return _buildCartItem(index, item);
                  },
                ),
              ),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Promo Code",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Times New Roman Bold',
                      color: Color(0xff232323)),
                )),
            _buildPromoCodeField(),
            _buildPriceSummary(),
            CustomButton(
              title: 'Checkout',
              onPressed: () {
                Get.to(CheckoutScreen());
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(int index, CartItem item) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black12),
          color: Color(0xffFFEDDE)),
      child: Row(
        children: [
          SizedBox(width: 20),
          Image.asset(item.image, height: 80),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.name,
                  style: TextStyle(
                      fontFamily: 'Times New Roman', color: Color(0xff404040))),
              Text("\$${item.price.toStringAsFixed(2)}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff404040),
                      fontFamily: 'Times New Roman',
                      fontSize: 18)),
              SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Color(0xFFFCE8D5)),
                      // color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              cartController.decreaseQuantity(index);
                            },
                            child: Icon(
                              Icons.remove,
                              color: Color(0xffBA9070),
                              size: 20,
                            ),
                          ),
                          SizedBox(width: 10),
                          Obx(() => Text("${item.quantity}")),
                          SizedBox(width: 10),
                          InkWell(
                              onTap: () {
                                cartController.increaseQuantity(index);
                              },
                              child: Icon(Icons.add,
                                  color: Color(0xffBA9070), size: 20)),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 90,
                  ),
                  // ✅ Show color selection ONLY for the first cart item
                  if (index == 0) ...[
                    Container(
                      margin: EdgeInsets.all(4),
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color(0xffEABCA3),
                        border: Border.all(
                          color: Color(0xffEABCA3),
                          width: 2,
                        ),
                      ),
                    ),
                  ],
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPromoCodeField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Stack(
        children: [
          SizedBox(
            height: 48,
            child: TextField(
              style: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: AppColors.primary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppConstants.primaryColor),
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary),
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: EdgeInsets.only(
                    left: 20), // Adjust padding for button space
              ),
              onChanged: (value) => cartController.promoCode.value = value,
            ),
          ),
          Positioned(
            right: 0,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 48,
                width: 100,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Apply Code",
                    style: TextStyle(
                        fontFamily: 'Times New Roman Bold',
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() => _buildPriceRow("Subtotal", cartController.subtotal)),
        // _buildPriceRow("Subtotal", cartController.subtotal),
        _buildPriceRow("Shipping Cost", 0.00),
        _buildPriceRow("Tax", cartController.tax),
        Divider(color: Colors.brown),
        Obx(() => _buildPriceRow("Total", cartController.total, isBold: true)),
      ],
    );
  }

  Widget _buildPriceRow(String title, double value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily:
                      isBold ? 'Times New Roman Bold' : 'Times New Roman')),
          Text("\$${value.toStringAsFixed(2)}",
              style: TextStyle(
                  fontSize: 16,
                  fontFamily:
                      isBold ? 'Times New Roman Bold' : 'Times New Roman')),
        ],
      ),
    );
  }
}
