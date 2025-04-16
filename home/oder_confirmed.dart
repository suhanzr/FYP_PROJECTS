import 'package:cosmetic_app/components/Button.dart';
import 'package:cosmetic_app/constant/constant.dart';
import 'package:cosmetic_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderConfirmedController extends GetxController {
  void continueShopping() {
    // Get.offAllNamed('/home');
    Get.toNamed(AppRoutes.bottomNavigation);
    // Replace with the actual home route
  }
}

class OrderConfirmedScreen extends StatelessWidget {
  final OrderConfirmedController controller =
      Get.put(OrderConfirmedController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCE6D2), // Matching background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Order Confirmed !",
              style: TextStyle(
                fontSize: 22,
                fontFamily: 'Times New Roman Bold',
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Your order has been placed successfully",
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Times New Roman Bold',
                color: Color(0xff8E6545),
              ),
            ),
            SizedBox(height: 24),
            Image.asset(
              'assets/success.gif',
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: CustomButton(
                title: "Continue Shopping",
                onPressed: () {
                  Get.toNamed(AppRoutes.bottomNavigation);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
