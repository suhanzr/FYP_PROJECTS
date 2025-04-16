import 'package:flutter/material.dart';

class AppConstants {
  // Base API URL
  static const String baseUrl = "https://api.example.com";

  // Endpoints
  static const String loginEndpoint = "$baseUrl/auth/login";
  static const String registerEndpoint = "$baseUrl/auth/register";
  static const String userProfileEndpoint = "$baseUrl/user/profile";

  // App Colors
  static const Color primaryColor = Color(0xFF64320D);
  static const Color secondaryColor = Colors.orange;
  static const Color backgroundColor = Color(0xFFffe6d2);

  // Text Colors
  static const Color primaryTextColor = Color(0xFF64320D);
  static const Color secondaryTextColor = Colors.black;
  static const Color whiteText = Colors.white;

  // Font Family
  static const String Roboto_Bold = "Roboto-Bold";
  static const String Roboto_Semi_Bold = "Roboto-Semi-Bold";
  static const String Roboto_Medium = "Roboto-Medium";
  static const String Roboto_Regular = "Roboto-Regular";

  // Padding & Spacing
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;

  // App Strings
  static const String appName = "My Flutter App";
  static const String welcomeMessage = "Welcome to My Flutter App!";
  static const String errorMessage = "Something went wrong. Please try again.";
}

// Usage Example

class AppColors {
  static const Color primary = Color(0xFF64320D);
  static const Color background = Color(0xFFFFE6D2);
}

class AppTextStyles {
  static final TextStyle logoStyle = TextStyle(
    fontFamily: 'Times New Roman Bold',
    fontSize: 28,
    color: AppColors.primary,
  );

  static final TextStyle subtitleStyle = TextStyle(
    fontFamily: 'Times New Roman',
    fontSize: 16,
    color: Colors.black87,
  );

  static final TextStyle linkStyle = TextStyle(
    fontSize: 16,
    fontFamily: "Times New Roman",
    color: AppColors.primary,
    // fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.primary, // Change underline color
    decorationThickness: 1,
  );

  static final TextStyle buttonTextStyle = TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontFamily: 'Times New Roman Bold',
  );

  static final TextStyle textStyle = TextStyle(
    fontSize: 16,
    color: AppColors.primary,
    fontFamily: 'Times New Roman',
  );
}
