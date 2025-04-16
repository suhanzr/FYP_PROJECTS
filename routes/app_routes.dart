import 'package:cosmetic_app/screens/auth/forget_screen.dart';
import 'package:cosmetic_app/screens/auth/login.dart';
import 'package:cosmetic_app/screens/auth/otp_screen.dart';
import 'package:cosmetic_app/screens/auth/reset_password_screen.dart';
import 'package:cosmetic_app/screens/auth/signup.dart';
import 'package:cosmetic_app/screens/bottom_navigation/bottom_nav.dart';
import 'package:cosmetic_app/screens/profile/edit_profile.dart';
import 'package:get/get.dart';
import '../screens/splash_screen.dart';

class AppRoutes {
  static const String splash = "/splash";
  static const String login = "/login";
  static const String signup = "/signup";
  static const String  forgotPassword  = "/forgot-password";
  static const String otp = "/otp";
  static const String resetPassword = "/reset-password";
  static const String passwordSuccess = "/password-success";
  static const String bottomNavigation = "/bottom_navigation";
  static const String editProfile = "/edit_profile";


  static final routes = [
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: signup, page: () => SignUpScreen()),
    GetPage(name: forgotPassword , page: () => ForgotPasswordScreen()),
    GetPage(name: otp, page: () => OTPVerificationScreen()),
    GetPage(name: resetPassword, page: () => ResetPasswordScreen()),
    GetPage(name: bottomNavigation, page: () => BottomNavigation()),
    GetPage(name: editProfile, page: () => EditProfileScreen()),
   
  ];
}
