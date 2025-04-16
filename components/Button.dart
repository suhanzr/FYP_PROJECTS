import 'package:cosmetic_app/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isDisabled;
  final TextStyle? textStyle;
  final ButtonStyle? buttonStyle;
  final Color textColor, buttonColor;
  final String? height, width;

  const CustomButton({
    Key? key,
    required this.title,
    this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.buttonColor = AppColors.primary,
    this.textColor = Colors.white,
    this.textStyle,
    this.buttonStyle,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height != null ? double.parse(height!) : 52.h,
      width: width != null ? double.parse(width!) : double.infinity,
      child: ElevatedButton(
        onPressed: isDisabled || isLoading ? null : onPressed,
        style: buttonStyle ??
            ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              padding: const EdgeInsets.symmetric(
                vertical: 10, // Vertical padding from Figma
                horizontal: 46, // Horizontal padding for dynamic width
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
        child: isLoading
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: SizedBox(
                  height: 25,
                  width: 25,
                  child: const CircularProgressIndicator(
                    color: AppColors.primary,
                    strokeWidth: 2.5,
                  ),
                ),
              )
            : Text(
                title,
                style: textStyle ??
                    TextStyle(
                      color: textColor,
                      fontSize: 18,
                      // fontWeight: FontWeight.w600,
                      fontFamily: "Times New Roman Bold",
                    ),
              ),
      ),
    );
  }
}
