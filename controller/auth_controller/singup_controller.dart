import 'package:get/get.dart';

class SignupController extends GetxController {
  var name = ''.obs;
  var email = ''.obs;
  var phone = ''.obs;
  var password = ''.obs;
  var countryCode = "+92".obs;
    var countryFlag = "🇵🇰".obs;
  var isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}
