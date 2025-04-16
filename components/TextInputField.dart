import 'package:cosmetic_app/constant/constant.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final TextInputType keyboardType;
  final void Function(String)? onChanged;
  final bool obscureText; // New optional parameter for obscuring text
  final Widget? icon;
  const CustomTextField({
    Key? key,
    this.controller,
    this.labelText,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.obscureText = false,
    this.icon, // Default value set to false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Center(
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          style: TextStyle(
            fontSize: 16,
          ),
          obscureText: obscureText,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          // Apply the obscureText parameter here
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            prefixIcon: (labelText?.toLowerCase().contains("password") ?? false)
                ? null
                : icon,
            suffixIcon: (labelText?.toLowerCase().contains("password") ?? false)
                ? icon
                : null,

            // suffixIcon: icon,
            // prefix: icon,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 25), // Adjust height & padding

            // labelStyle: TextStyle(
            //   color: Colors.grey,
            //   fontSize: 16,
            //   fontFamily: "Roboto-Regular",
            // ),

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
              borderSide: const BorderSide(color: AppConstants.primaryColor),
              borderRadius: BorderRadius.circular(50),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.primary,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          keyboardType: keyboardType,
        ),
      ),
    );
  }
}
