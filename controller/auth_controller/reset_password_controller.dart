import 'package:cosmetic_app/screens/auth/reset_password_screen.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  var oldPassword = ''.obs;
  var newPassword = ''.obs;
  var confirmPassword = ''.obs;
  var isButtonEnabled = false.obs;

  void setNewPassword(String value) {
    newPassword.value = value;
    validateForm();
  }

  void setOldPassword(String value) {
    oldPassword.value = value;
    validateForm();
  }

  void setConfirmPassword(String value) {
    confirmPassword.value = value;
    validateForm();
  }

  void validateForm() {
    if (newPassword.value.isNotEmpty &&
        confirmPassword.value.isNotEmpty &&
        newPassword.value == confirmPassword.value) {
      isButtonEnabled.value = true;
    } else {
      isButtonEnabled.value = false;
    }
  }

  void showSuccessDialog() {
    Get.dialog(SuccessDialog());
  }
}
