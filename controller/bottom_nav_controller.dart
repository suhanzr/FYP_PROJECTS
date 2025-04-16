import 'dart:async';

import 'package:get/get.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;
  var selectedCategory = "Favourites".obs; // Default category

  var rotatingBannerText =
      "Free Shipping on all order above 100 \$. Free Shipping on all orders above 100 \$."
          .obs;
  var textPosition = 1.0.obs;

  @override
  void onInit() {
    super.onInit();
    _startSlidingText();
  }

  void _startSlidingText() {
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      textPosition.value -= 0.01;
      if (textPosition.value <= -1.2) {
        textPosition.value = 1.0;
      }
    });
  }

  void onItemTapped(int index, {String? category}) {
    selectedIndex.value = index;
    if (index == 0) {
      selectedCategory.value = ''; // Clears category when navigating to Home
    } else if (category != null) {
      selectedCategory.value = category; // Update category only if provided
    }
  }
}
