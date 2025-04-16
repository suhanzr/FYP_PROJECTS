import 'package:cosmetic_app/components/Button.dart';
import 'package:cosmetic_app/constant/constant.dart';
import 'package:cosmetic_app/screens/home/oder_confirmed.dart';
import 'package:cosmetic_app/screens/profile/card_details.dart';
import 'package:cosmetic_app/screens/profile/change_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  var selectedPaymentMethod = 'COD'.obs;
}

class CheckoutScreen extends StatelessWidget {
  final CheckoutController checkoutController = Get.put(CheckoutController());
  void _confirmOrder() {
    Get.dialog(
      barrierColor: AppColors.background,
      Center(
        child: Image.asset(
          'assets/loading.gif', // Replace with the correct GIF path
          width: 100, // Adjust as needed
          height: 100,
        ),
      ),
      barrierDismissible: false, // Prevent closing before 3 seconds
    );

    // Wait for 3 seconds and then navigate to the next screen
    Future.delayed(Duration(seconds: 3), () {
      Get.back(); // Close the loading dialog
      Get.to(OrderConfirmedScreen()); // Navigate to the next screen
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Checkout",
            style: TextStyle(
                fontFamily: 'Times New Roman Bold', color: Color(0xff212121))),
        backgroundColor: AppColors.background,
        surfaceTintColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(
                "Shipping Address", Icons.local_shipping_outlined),
            SizedBox(height: 20),
            _buildAddressBox(),
            SizedBox(height: 20),
            Row(
              children: [
                Image(image: AssetImage('assets/wallet.png')),
                SizedBox(width: 8),
                Text("Payment Method",
                    style: TextStyle(
                        fontFamily: 'Times New Roman Bold',
                        color: AppColors.primary,
                        fontSize: 16)),
              ],
            ),
            SizedBox(height: 20),
            _buildPaymentMethods(),
            SizedBox(height: 20),
            _buildSectionTitle("Order Summary", Icons.assignment_outlined),
            SizedBox(height: 20),
            _buildOrderSummaryList(),
            SizedBox(height: 20),
            _buildTotalAmount(),
            SizedBox(height: 20),
            CustomButton(
              title: 'Place Order',
              onPressed: () {
                _confirmOrder();
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: AppColors.primary),
        SizedBox(width: 8),
        Text(title,
            style: TextStyle(
                fontFamily: 'Times New Roman Bold',
                color: AppColors.primary,
                fontSize: 16)),
      ],
    );
  }

  Widget _buildAddressBox() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(45),
        border: Border.all(color: AppColors.primary),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image(image: AssetImage('assets/location.png')),
              SizedBox(width: 8),
              Text("House#123, street abc, NYC",
                  style: TextStyle(
                    fontFamily: 'Times New Roman',
                    color: Color(0xff8E6545),
                  )),
            ],
          ),
          InkWell(
              onTap: () {
                Get.to(ChangeAddressScreen(),
                    arguments: 'House#123, street abc, NYC');
              },
              child: Image(image: AssetImage('assets/edit.png')))
        ],
      ),
    );
  }

  Widget _buildPaymentMethods() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primary),
      ),
      child: Column(
        children: [
          _buildPaymentOption("COD", "COD"),
          _buildPaymentOption("Visa", "Visa ... 3534",
              imagePath: 'assets/VISA.png'),
          _buildPaymentOption("GooglePay", "Pay",
              imagePath: 'assets/google.png'),
        ],
      ),
    );
  }

  Widget _buildPaymentOption(String value, String title, {String? imagePath}) {
    return Obx(() {
      bool isSelected = checkoutController.selectedPaymentMethod.value == value;

      return Stack(
        children: [
          RadioListTile(
            value: value,
            groupValue: checkoutController.selectedPaymentMethod.value,
            onChanged: (val) =>
                checkoutController.selectedPaymentMethod.value = val.toString(),
            title: Row(
              children: [
                if (imagePath != null) // Check if an image is provided
                  Image.asset(
                    imagePath,
                    width: 18, // Adjust width as needed
                    height: 18, // Adjust height as needed
                    fit: BoxFit.contain,
                  ),
                if (imagePath != null)
                  SizedBox(width: 10), // Add spacing if image exists
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Times New Roman',
                    color: AppColors.primary,
                    // Color(0xffAD7951),
                  ),
                ),
              ],
            ),
            activeColor: AppColors.primary,
          ),
          if (isSelected &&
              value == "Visa") // Show edit icon only for Visa when selected
            Positioned(
              right: 10, // Adjust position as needed
              top: 15,
              child: GestureDetector(
                onTap: () {
                  Get.to(CardDetailsScreen(), arguments: 'CheckOut');
                },
                child: Image.asset(
                  'assets/edit.png',
                  width: 20, // Adjust size as needed
                  height: 20,
                ),
              ),
            ),
        ],
      );
    });
  }

  Widget _buildOrderSummaryList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildOrderSummary(
            index: 0,
            imagePath: "assets/recommended/foundation.png",
            name: "Mac Studio Foundation",
            price: 47.00,
          ),
          _buildOrderSummary(
            index: 1,
            imagePath: "assets/new_arrivals/blush_stick.png",
            name: "Blush Stick - Makeup by Mario",
            price: 32.00,
          ),
          _buildOrderSummary(
            index: 2,
            imagePath: "assets/Sale Product/eye palette.png",
            name: "Eyeshadow Palette by Anastasia",
            price: 33.00,
          ),
        ],
      ),
    );
  }

  Widget _buildOrderSummary({
    required int index,
    required String imagePath,
    required String name,
    required double price,
  }) {
    return Container(
      width: 300, // Adjust width to fit 3 cards in view
      margin: EdgeInsets.only(right: 12), // Spacing between cards
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Color(0xffFFEDDE)
          // border: Border.all(color: Colors.brown),
          ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imagePath, height: 50),
          SizedBox(width: 10),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(name,
                style: TextStyle(
                    fontFamily: 'Times New Roman', color: Color(0xff404040))),
            Text("\$${price.toStringAsFixed(2)}",
                style: TextStyle(
                    fontFamily: 'Times New Roman Bold',
                    fontSize: 18,
                    color: Color(0xff404040))),
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Color(0xFFFCE8D5)),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.remove,
                            color: AppColors.primary,
                            size: 20,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text("1"),
                        SizedBox(width: 10),
                        InkWell(
                            onTap: () {},
                            child: Icon(Icons.add,
                                color: AppColors.primary, size: 20)),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  width: 80,
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
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildTotalAmount() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPriceRow("Subtotal", "\$112"),
        _buildPriceRow("Shipping Cost", "\$0.00"),
        _buildPriceRow("Tax", "\$5.00"),
        Divider(color: Colors.brown),
        _buildPriceRow("Total", "\$117", isBold: true),
      ],
    );
  }

  Widget _buildPriceRow(String title, String value, {bool isBold = false}) {
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
          Text(value,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily:
                      isBold ? 'Times New Roman Bold' : 'Times New Roman')),
        ],
      ),
    );
  }
}
