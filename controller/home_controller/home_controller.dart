import 'dart:async';
import 'package:cosmetic_app/controller/bottom_nav_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var rotatingBannerText = "Free Shipping on all orders above 100\$".obs;
  var saleBannerIndex = 0.obs;
  var selectedCategory = "All".obs; // Store selected category
  final BottomNavController controller = Get.find<BottomNavController>();
  List<String> rotatingBanners = [
    "Free Shipping on all orders above 100\$",
    "Special Discounts on Makeup Products",
    "Buy 2 Get 1 Free Offer Available"
  ];

  var favoriteItems = <String>{}.obs; // Store favorite product names

  void toggleFavorite(String productName) {
    if (favoriteItems.contains(productName)) {
      favoriteItems.remove(productName);
    } else {
      favoriteItems.add(productName);
    }
  }

  bool isFavorite(String productName) {
    return favoriteItems.contains(productName);
  }

  List<Map<String, dynamic>> saleBanners = [
    {
      "image": "assets/b1.png",
    },
    {
      "image": "assets/b2.png",
    },
    {
      "image": "assets/b3.png",
    },
  ];

  @override
  void onInit() {
    super.onInit();
 
    _startSaleBannerRotation();
  }

  void _startSaleBannerRotation() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      saleBannerIndex.value = (saleBannerIndex.value + 1) % saleBanners.length;
    });
  }

  // Function to change category and navigate
  void changeCategoryAndNavigate(String category) {
    selectedCategory.value = category;
    // controller.selectedIndex.value = 1;

    controller.onItemTapped(1, category: category);
    // Get.to(() => Favourites(name: category));
  }
}
