import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  var selectedImageIndex = 0.obs;
  var isFavorite = false.obs;
  var selectedColorIndex = (-1).obs;
  var currentIndex = 0.obs; // Start with the first image

  var isAddedToCart = false.obs; // Track button state

  void toggleCart() {
    isAddedToCart.value = !isAddedToCart.value;
  }

  void nextImage(List<String> images) {
    if (currentIndex.value < images.length - 1) {
      currentIndex.value++;
    }
  }

  void previousImage() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
    }
  }

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }

  void selectColor(int index) {
    selectedColorIndex.value = index;
  }
}
