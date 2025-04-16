import 'package:cosmetic_app/components/Button.dart';
import 'package:cosmetic_app/constant/constant.dart';
import 'package:cosmetic_app/controller/auth_controller/forget_controller.dart';
import 'package:cosmetic_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerificationScreen extends StatelessWidget {
  final ForgetController controller = Get.find<ForgetController>();

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "We have sent an OTP to the email address you provided. Please enter that 5 digit code mentioned in the email.",
              style: TextStyle(
                  fontFamily: 'Times New Roman',
                  color: AppColors.primary,
                  fontSize: 15.5),
            ),
            const SizedBox(height: 40),
            PinCodeTextField(
              appContext: context,
              length: 5,
              cursorColor: AppColors.primary,
              keyboardType: TextInputType.number,
              onChanged: (value) => controller.setOtp(value),
              pinTheme: PinTheme(
                fieldHeight: 56,
                fieldWidth: 56,
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(10),
                activeFillColor: Colors.green.shade100,
                selectedFillColor: Colors.white,
                inactiveFillColor: Colors.white,
                activeColor: AppColors.primary,
                inactiveColor: AppColors.primary,
                selectedColor: AppColors.primary,
              ),
            ),

            const SizedBox(height: 25),
            Obx(
              () => CustomButton(
                  title: "Verify OTP",
                  isDisabled: !controller.isButtonEnabled.value,
                  onPressed: () {
                    Get.toNamed(AppRoutes.resetPassword);
                  }),
            ),
            const SizedBox(height: 10),
            Obx(() => RichText(
                  text: TextSpan(
                    style: AppTextStyles.textStyle,
                    children: [
                      TextSpan(
                        text: "Haven’t got the email yet? ",
                        style: const TextStyle(
                            fontSize: 15.5,
                            fontFamily: 'Times New Roman Bold',
                            color: Color(0xff8E6545)),
                      ),
                      WidgetSpan(
                        child: controller.isResendEnabled.value
                            ? GestureDetector(
                                onTap: () {
                                  controller.startResendCountdown();
                                },
                                child: Text(
                                  "Resend OTP",
                                  style: const TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 15.5,
                                    fontFamily: 'Times New Roman Bold',
                                  ),
                                ),
                              )
                            : Text(
                                "00:${controller.resendTime.value}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: AppColors.primary,
                                ),
                              ),
                      ),
                    ],
                  ),
                ))

            //   Row(

            //     children: [
            //       Text("Haven’t got the email yet?",
            //           style: AppTextStyles.textStyle),
            //       TextButton(
            //         onPressed: () {
            //           Get.offAllNamed(AppRoutes.signup);
            //         },
            //         child: Obx(() => controller.isResendEnabled.value
            //             ? TextButton(
            //                 onPressed: () {
            //                   controller.startResendCountdown();
            //                 },
            //                 child: const Text("Resend OTP",
            //                     style: TextStyle(
            //                         color: Colors.grey,
            //                         fontSize: 16,
            //                         fontFamily: 'Times New Roman')),
            //               )
            //             : Text("00:${controller.resendTime.value}",
            //                 style: const TextStyle(
            //                     fontSize: 16, color: AppColors.primary))),

            //         // Text('Resend OTP',
            //         //     style: TextStyle(
            //         //       fontSize: 16,
            //         //       color: AppColors.primary,
            //         //       fontFamily: 'Times New Roman Bold',
            //         //     )),
            //       ),
            //     ],
            //   )
          ],
        ),
      ),
    );
  }
}
