import 'package:cosmetic_app/components/Button.dart';
import 'package:cosmetic_app/components/TextInputField.dart';
import 'package:cosmetic_app/constant/constant.dart';
import 'package:cosmetic_app/screens/profile/card_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewCardScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7E3D0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Card Details',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Times New Roman Bold',
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Get.arguments != null
            //     ?
            Text(
              'Add New Card',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Times New Roman Bold',
                fontWeight: FontWeight.bold,
                color: Color(0xff212121),
              ),
            ),
            // : SizedBox(),
            SizedBox(height: 20),

            // Email Input
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Card Holder Name",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Times New Roman Bold',
                      color: AppColors.primary),
                )),
            const SizedBox(height: 10),
            CustomTextField(
              controller: nameController,
              hintText: 'Card Holder Name',
            ),
            SizedBox(height: 20),

            // Email Input
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Card Number",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Times New Roman Bold',
                      color: AppColors.primary),
                )),
            const SizedBox(height: 10),
            CustomTextField(
              controller: cardNumberController,
              hintText: 'Card Number',
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Expiry Date",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Times New Roman Bold',
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: expiryController,
                        hintText: 'Expiry date',
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "CVV",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Times New Roman Bold',
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: cvvController,
                        hintText: 'CVV',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            CustomButton(
              title: 'Save Changes',
              onPressed: () {
                Get.dialog(SuccessDialog());
                // print(Get.arguments);
                Future.delayed(Duration(seconds: 5), () {
                  // Get.back(); // Close the loading dialog

                  Get.to(CardDetailsScreen());

                  // Navigate to the next screen
                });
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class SuccessDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Align(
            //   alignment: Alignment.topRight,
            //   child: GestureDetector(
            //     onTap: () => Get.back(),
            //     child: Icon(Icons.close, color: Colors.black),
            //   ),
            // ),
            Image.asset(
              'assets/success.gif',
            ),

            Text("Card added successfully ! ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 16,
                    fontFamily: 'Times New Roman Bold')),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
