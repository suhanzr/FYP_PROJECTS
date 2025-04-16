import 'package:cosmetic_app/components/Button.dart';
import 'package:cosmetic_app/components/TextInputField.dart';
import 'package:cosmetic_app/constant/constant.dart';
import 'package:cosmetic_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SignUpController controller = Get.put(SignUpController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              // Logo & Title\
              Image.asset("assets/logo.png", height: 80),

              const SizedBox(height: 20),
              Text(
                "Sign up",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'Times New Roman Bold',
                    color: AppColors.primary),
              ),
              Text(
                "Start Your Beauty Journey !",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Times New Roman Bold',
                    color: AppColors.primary),
              ),
              SizedBox(height: 30),

//Your Name
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Your Name",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Times New Roman Bold',
                        color: AppColors.primary),
                  )),
              const SizedBox(height: 10),
              CustomTextField(
                controller: controller.emailController,
                hintText: 'Enter your name',
                keyboardType: TextInputType.emailAddress,
                icon: Icon(Icons.account_circle_outlined,
                    size: 20, color: AppColors.primary),
              ),
              const SizedBox(height: 20),
              // Email Input
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Your Email Address",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Times New Roman Bold',
                        color: AppColors.primary),
                  )),
              const SizedBox(height: 10),
              CustomTextField(
                controller: controller.emailController,
                hintText: 'Enter your email address',
                keyboardType: TextInputType.emailAddress,
                icon: Icon(Icons.email_outlined,
                    size: 20, color: AppColors.primary),
              ),

              const SizedBox(height: 20),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Your Password",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Times New Roman Bold',
                        color: AppColors.primary),
                  )),
              const SizedBox(height: 10),
              // Password Input
              Obx(() => SizedBox(
                    height: 48,
                    child: TextField(
                      controller: controller.passwordController,
                      obscureText: controller.isPasswordHidden.value,
                      decoration: InputDecoration(
                          hintText: 'Your Password',
                          prefixIcon: Icon(Icons.lock,
                              size: 15, color: AppColors.primary),
                          hintStyle: TextStyle(
                            color: Color(0xff8E6545),
                            fontSize: 14,
                            fontFamily: "Times New Roman",
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              controller.isPasswordHidden.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColors.primary,
                            ),
                            onPressed: () =>
                                controller.togglePasswordVisibility(),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: AppConstants.primaryColor),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: AppColors.primary,
                            ),
                            borderRadius: BorderRadius.circular(50),
                          )),
                    ),
                  )),

              SizedBox(height: 20),

              // Login Button

              CustomButton(title: 'Sign up', onPressed: () {}),
              SizedBox(height: 10),

              // Divider
              Text(' - - - - - - - - - - - - '),
              SizedBox(height: 10),

              // Google Sign In Button

              Container(
                height: 56.h,
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12, // Vertical padding from Figma
                      horizontal: 46, // Horizontal padding for dynamic width
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/google.png',
                    height: 25,
                  ),
                  label: Text(
                    'Continue with Google',
                    style: AppTextStyles.buttonTextStyle
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 5),

              RichText(
                text: TextSpan(
                  style: AppTextStyles.textStyle,
                  children: [
                    TextSpan(
                      text: "Already have an account? ",
                    ),
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: () {
                          Get.offAllNamed(AppRoutes.login);
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.primary,
                            fontFamily: 'Times New Roman Bold',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Constants File

// Login Controller
class SignUpController extends GetxController {
  var isPasswordHidden = true.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }
}
