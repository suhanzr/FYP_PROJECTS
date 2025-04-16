import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Login Controller (GetX)

class LoginController extends GetxController {
  var isPasswordHidden = true.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }
}
