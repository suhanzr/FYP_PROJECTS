import 'package:cosmetic_app/components/Button.dart';
import 'package:cosmetic_app/components/TextInputField.dart';
import 'package:cosmetic_app/constant/constant.dart';
import 'package:cosmetic_app/controller/auth_controller/forget_controller.dart';
import 'package:cosmetic_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final ForgetController controller = Get.put(ForgetController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        surfaceTintColor: AppColors.background,
        centerTitle: true,
        title: Text('Forgot Password',
            style: TextStyle(fontSize: 20, fontFamily: 'Times New Roman Bold')),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Please enter your email to reset the password.",
                style: TextStyle(
                    fontFamily: 'Times New Roman',
                    color: AppColors.primary,
                    fontSize: 16),
              ),
              const SizedBox(height: 30),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Email Address",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Times New Roman Bold',
                        color: AppColors.primary),
                  )),
              const SizedBox(height: 10),
              CustomTextField(
                hintText: "Enter Your Email",
                icon: Icon(Icons.alternate_email_rounded,
                    color: AppColors.primary),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) => controller.setEmail(value),
              ),
              const SizedBox(height: 60),
              CustomButton(
                title: 'Send OTP',
                onPressed: () {
                  Get.toNamed(AppRoutes.otp);
                  controller.startResendCountdown();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
