import 'package:cosmetic_app/components/Button.dart';
import 'package:cosmetic_app/components/TextInputField.dart';
import 'package:cosmetic_app/constant/constant.dart';
import 'package:cosmetic_app/routes/app_routes.dart';
import 'package:cosmetic_app/screens/home/checkout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeAddressScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
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
          'Address Details',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Times New Roman Bold',
              fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(height: 40),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Current Address",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Times New Roman Bold',
                      color: AppColors.primary),
                )),
            const SizedBox(height: 10),
            CustomTextField(
              // controller: nameController,
              hintText: 'House#123, street abc, NYC',
            ),
            SizedBox(height: 20),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "New Address",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Times New Roman Bold',
                      color: AppColors.primary),
                )),
            const SizedBox(height: 10),
            SizedBox(
                height: 48,
                child: Center(
                  child: TextField(
                    controller: nameController,

                    style: TextStyle(fontSize: 16),

                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    // Apply the obscureText parameter here
                    decoration: InputDecoration(
                      hintText: 'Type Here ..',
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Image(image: AssetImage('assets/location.png')),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 25), // Adjust height & padding

                      hintStyle: TextStyle(
                        color: Color(0xff8E6545),
                        fontSize: 14,
                        fontFamily: "Times New Roman",
                      ),
                      floatingLabelStyle: const TextStyle(
                          color: Colors.black), // Label color when focused
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppConstants.primaryColor),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: AppColors.primary,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                )),
            SizedBox(height: 50),
            CustomButton(
                title: 'Save Changes',
                onPressed: () {
                  Get.arguments != null
                      ? Get.to(CheckoutScreen())
                      : Get.toNamed(AppRoutes.bottomNavigation);
                }),
          ],
        ),
      ),
    );
  }
}
