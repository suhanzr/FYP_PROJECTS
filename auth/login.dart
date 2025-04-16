import 'package:cosmetic_app/components/Button.dart';
import 'package:cosmetic_app/components/TextInputField.dart';
import 'package:cosmetic_app/constant/constant.dart';
import 'package:cosmetic_app/controller/auth_controller/signin_controller.dart';
import 'package:cosmetic_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              // Logo & Title\
              Image.asset("assets/logo.png", height: 80),

              const SizedBox(height: 20),
              Text(
                "Log in",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'Times New Roman Bold',
                    color: AppColors.primary),
              ),
              Text(
                "Let’s Get Started !",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Times New Roman Bold',
                    color: AppColors.primary),
              ),
              SizedBox(height: 30),

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
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(15),
                            child: SvgPicture.asset(
                              'assets/password.svg',
                              fit: BoxFit
                                  .contain, // Ensures SVG fits well inside the container
                            ),
                          ),
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
              SizedBox(height: 10),

              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.forgotPassword);
                  },
                  child:
                      Text('Forgot Password?', style: AppTextStyles.linkStyle),
                ),
              ),
              SizedBox(height: 20),

              // Login Button

              CustomButton(
                  title: 'Login',
                  onPressed: () {
                    Get.toNamed(AppRoutes.bottomNavigation);
                  }),
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
              // Sign Up
              RichText(
                text: TextSpan(
                  style: AppTextStyles.textStyle,
                  children: [
                    TextSpan(
                      text: "Don't have an account? ",
                    ),
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: () {
                          Get.offAllNamed(AppRoutes.signup);
                        },
                        child: Text(
                          'Sign up',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Constants File
