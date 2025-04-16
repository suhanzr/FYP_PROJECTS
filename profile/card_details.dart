import 'package:cosmetic_app/components/Button.dart';
import 'package:cosmetic_app/constant/constant.dart';
import 'package:cosmetic_app/screens/home/checkout.dart';
import 'package:cosmetic_app/screens/profile/add_new_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardDetailsScreen extends StatelessWidget {
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
          onPressed: () => Get.to(CheckoutScreen()),
        ),
        title: Text(
          'Card Details',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Times New Roman Bold',
              fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20),
            Image(image: AssetImage('assets/C2.png')),
            // _buildCard(),
            SizedBox(height: 20),
            _buildSavedCard(),
            Spacer(),

            CustomButton(
              title: 'Add New Card',
              onPressed: () {
                Get.to(AddNewCardScreen());
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSavedCard() {
    return Container(
      height: 64,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.brown),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image(
                image: AssetImage('assets/VISA.png'),
                height: 20,
                width: 20,
              ),
              SizedBox(width: 10),
              Text(
                'Visa ... 3534',
                style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 16,
                    fontFamily: 'Times New Roman Bold'),
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.delete_outline, color: AppColors.primary),
            onPressed: () {
              Get.dialog(RemoveSuccessDialog());
            },
          ),
        ],
      ),
    );
  }
}

class RemoveSuccessDialog extends StatelessWidget {
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

            Text("Card Removed Successfully ! ",
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
