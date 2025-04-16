import 'package:cosmetic_app/components/Button.dart';
import 'package:cosmetic_app/components/TextInputField.dart';
import 'package:cosmetic_app/constant/constant.dart';
import 'package:cosmetic_app/controller/auth_controller/reset_password_controller.dart';
import 'package:cosmetic_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  final ResetPasswordController controller = Get.put(ResetPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        surfaceTintColor: AppColors.background,
        centerTitle: true,
        title: Text('Reset Password',
            style: TextStyle(fontSize: 20, fontFamily: 'Times New Roman Bold')),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Create a new password. Ensure it differs from previous ones for security",
                style: TextStyle(
                    fontFamily: 'Times New Roman',
                    color: AppColors.primary,
                    fontSize: 16),
              ),
              const SizedBox(height: 30),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Old Password",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Times New Roman Bold',
                        color: AppColors.primary),
                  )),
              const SizedBox(height: 10),

              // New Password Field
              CustomTextField(
                hintText: "Type here...",
                obscureText: true,
                onChanged: (value) => controller.setOldPassword(value),
              ),

              const SizedBox(height: 10),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "New Password",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Times New Roman Bold',
                        color: AppColors.primary),
                  )),
              const SizedBox(height: 10),
              // Confirm Password Field
              CustomTextField(
                hintText: "Type here...",
                obscureText: true,
                onChanged: (value) => controller.setNewPassword(value),
              ),

              const SizedBox(height: 10),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Confirm Password",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Times New Roman Bold',
                        color: AppColors.primary),
                  )),
              const SizedBox(height: 10),
              // Confirm Password Field
              CustomTextField(
                hintText: "Type here...",
                obscureText: true,
                onChanged: (value) => controller.setConfirmPassword(value),
              ),
              const SizedBox(height: 35),

              // Reset Password Button

              Obx(
                () => CustomButton(
                    title: "Save Changes",
                    isDisabled: controller.isButtonEnabled.isFalse,
                    onPressed: () {
                      controller.showSuccessDialog();
                      // Wait for 3 seconds and then navigate to the next screen
                      Future.delayed(Duration(seconds: 3), () {
                        Get.toNamed(
                            AppRoutes.login); // Navigate to the next screen
                      });
                    }),
              ),
            ],
          ),
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

            Text("Password updated\nSuccessfully ! ",
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
