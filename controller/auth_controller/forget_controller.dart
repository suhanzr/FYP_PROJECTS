// import 'package:get/get.dart';

// class ForgetController extends GetxController {
//   var email = ''.obs;
//   var otp = ''.obs;
//   var isButtonEnabled = false.obs;
//   var isResendEnabled = true.obs;
//   var resendTime = 60.obs;

//   void setEmail(String value) {
//     email.value = value;
//   }

//   void setOtp(String value) {
//     otp.value = value;
//     isButtonEnabled.value = otp.value.length == 6;
//   }

//   void startResendCountdown() {
//     isResendEnabled.value = false;
//     resendTime.value = 60;
//     update();
//     Future.delayed(const Duration(seconds: 1), () {
//       if (resendTime > 0) {
//         resendTime.value--;
//         startResendCountdown();
//       } else {
//         isResendEnabled.value = true;
//       }
//     });
//   }
// }
import 'dart:async';
import 'package:get/get.dart';

class ForgetController extends GetxController {
  var email = ''.obs;
  var otp = ''.obs;
  var isButtonEnabled = false.obs;
  var isResendEnabled = true.obs;
  var resendTime = 60.obs;
  Timer? _timer;

  void setEmail(String value) {
    email.value = value;
  }

  void setOtp(String value) {
    otp.value = value;
    isButtonEnabled.value = otp.value.length == 5;
  }

  void startResendCountdown() {
    if (_timer != null) {
      _timer!.cancel(); // Cancel any existing timer
    }

    isResendEnabled.value = false;
    resendTime.value = 60;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resendTime.value > 0) {
        resendTime.value--;
      } else {
        timer.cancel(); // Stop the timer when time reaches zero
        isResendEnabled.value = true;
      }
    });
  }

  @override
  void onClose() {
    _timer
        ?.cancel(); // Ensure the timer is canceled when controller is disposed
    super.onClose();
  }
}
