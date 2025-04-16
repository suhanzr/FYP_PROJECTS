import 'package:cosmetic_app/components/TextInputField.dart';
import 'package:cosmetic_app/constant/constant.dart';
import 'package:cosmetic_app/controller/home_controller/home_controller.dart';
import 'package:cosmetic_app/screens/favourites/product_details.dart';
import 'package:cosmetic_app/screens/home/cart.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),

              // Search Bar
              Row(
                children: [
                  SizedBox(
                    width: 350.w,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: CustomTextField(
                        hintText: 'Search here',
                        icon: Icon(Icons.search, color: Color(0xff6C3B2C)),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(CartScreen()),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Image(
                        image: AssetImage(
                          'assets/cart.png',
                        ),
                        // fit: BoxFit.cover,
                        // width: 30,
                        // height: 30,
                      ),
                    ),
                  )
                ],
              ),

              // Category Filters (All, New Arrival, Recommendations)

              Obx(() => SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        'All',
                        'New Arrivals',
                        'Recommendations',
                        'Sale Products',
                      ]
                          .map((category) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: GestureDetector(
                                  onTap: () {
                                    if (category == 'All') {
                                      controller.selectedCategory.value = 'All';
                                    } else {
                                      controller
                                          .changeCategoryAndNavigate(category);
                                    }

                                    // controller
                                    //     .changeCategoryAndNavigate(category);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 3, horizontal: 16),
                                    decoration: BoxDecoration(
                                      color:
                                          controller.selectedCategory.value ==
                                                  category
                                              ? Color(0xFFCE9183)
                                              : Colors.transparent,
                                      borderRadius: BorderRadius.circular(20),
                                      border: controller
                                                  .selectedCategory.value ==
                                              category
                                          ? Border.all(color: Color(0xFFCE9183))
                                          : Border.all(
                                              color: AppColors.primary),
                                    ),
                                    child: Text(
                                      category,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Times New Roman',
                                        color:
                                            controller.selectedCategory.value ==
                                                    category
                                                ? Colors.white
                                                : AppColors.primary,
                                      ),
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  )),
              SizedBox(height: 10),

              Obx(() {
                var banner =
                    controller.saleBanners[controller.saleBannerIndex.value];
                return Image.asset(
                  banner["image"], // Dynamic image
                  height: 209,
                  width: MediaQuery.sizeOf(context).width, // Adjust as needed
                  fit: BoxFit.fill,
                );
              }),

              // New Arrivals Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("New Arrivals",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Times New Roman Bold',
                          color: AppColors.primary,
                        )),
                    GestureDetector(
                        onTap: () {
                          controller.controller
                              .onItemTapped(1, category: 'New Arrivals');
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Text(
                              "View all",
                              style: TextStyle(
                                fontFamily: 'Times New Roman Bold',
                                color: AppColors.primary,
                              ),
                            ),
                            Positioned(
                              left: 3,
                              bottom:
                                  0, // Adjust this value to control vertical padding
                              child: Container(
                                width: 50, // Adjust according to text width
                                height: 2, // Thickness of underline
                                color: AppColors.primary, // Underline color
                              ),
                            ),
                          ],
                        )

                        // Text("View all",
                        //     style: TextStyle(
                        //       fontFamily: 'Times New Roman Bold',
                        //       decoration: TextDecoration.underline,
                        //       decorationColor:
                        //           AppColors.primary, // Change underline color
                        //       decorationThickness: 2,
                        //       color: AppColors.primary,
                        //     )),
                        ),
                  ],
                ),
              ),

              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _productCard("Blush Stick", "Makeup by Mario", "\$32",
                        "assets/new_arrivals/blush_stick.png"),
                    _productCard("Eye Liner", "Inglot", "\$15",
                        "assets/new_arrivals/eye_liner.png"),
                    _productCard("Concealer", "Elf Cosmetics", "\$15",
                        "assets/new_arrivals/concealer.png"),
                    _productCard("Blush", "Rare Beauty", "\$40",
                        "assets/new_arrivals/blush.png"),
                    _productCard("Hair Mask", "Gisou", "\$38",
                        "assets/new_arrivals/hair_mask.png"),
                  ],
                ),
              ),

              // Recommended for You Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Recommended for you",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Times New Roman Bold',
                          color: AppColors.primary,
                        )),
                    GestureDetector(
                        onTap: () {
                          controller.controller
                              .onItemTapped(1, category: 'Recommendations');
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Text(
                              "View all",
                              style: TextStyle(
                                fontFamily: 'Times New Roman Bold',
                                color: AppColors.primary,
                              ),
                            ),
                            Positioned(
                              left: 3,
                              bottom:
                                  0, // Adjust this value to control vertical padding
                              child: Container(
                                width: 50, // Adjust according to text width
                                height: 2, // Thickness of underline
                                color: AppColors.primary, // Underline color
                              ),
                            ),
                          ],
                        )

                        // Text("View all",
                        //     style: TextStyle(
                        //         fontFamily: 'Times New Roman',
                        //         decoration: TextDecoration.underline,
                        //         decorationColor:
                        //             AppColors.primary, // Change underline color
                        //         decorationThickness: 1,
                        //         color: AppColors.primary)),
                        ),
                  ],
                ),
              ),

              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _recommendedCard(Product(
                        name: "Foundation",
                        category: 'Recommendations',
                        brand: "MAC Studio",
                        price: 47,
                        image: "assets/recommended/foundation.png")),
                    _recommendedCard(Product(
                        name: "Mascara",
                        category: 'Recommendations',
                        brand: "Maybelline",
                        price: 10,
                        image: "assets/recommended/mascara maybelline.png")),
                    _recommendedCard(Product(
                        name: "Highlighter",
                        category: 'Recommendations',
                        brand: "Charlotte Tibury",
                        price: 55,
                        image: "assets/recommended/highlighter charlotte.png")),
                    _recommendedCard(
                      Product(
                          name: "Lipstick",
                          category: 'Recommendations',
                          brand: "YSL",
                          price: 35,
                          image: "assets/recommended/lipstick.png"),
                    ),
                    _recommendedCard(Product(
                        name: "Blush Brush",
                        category: 'Recommendations',
                        brand: "Bobbi Brown",
                        price: 55, // Change the type from int to double
                        image: "assets/recommended/blush bursh.png")),
                  ],
                ),
              ),

              // Sale for You Section
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.sizeOf(context).width, // Border width
                height: 1, // 50% height of the card
                color: AppColors.primary, // Border color
              ),

              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Sale Product",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Times New Roman Bold',
                          color: AppColors.primary,
                        )),
                    Text("View all",
                        style: TextStyle(
                            fontFamily: 'Times New Roman',
                            color: AppColors.primary)),
                  ],
                ),
              ),

              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _saleCard("Lipstick", "DIOR", "\$38",
                        "assets/new_arrivals/blush_stick.png", '10'),
                    _saleCard("Eye Palette", "Anastasia", "\$33",
                        "assets/new_arrivals/eye_liner.png", '25'),
                    _saleCard("Color Corector", "Huda Beauty", "\$28",
                        "assets/new_arrivals/concealer.png", '5'),
                    _saleCard("Bronze", "Bobbi Brown", "\$10",
                        "assets/new_arrivals/blush.png", '5'),
                    _saleCard("Setting Spray", "YSL", "\$26",
                        "assets/new_arrivals/hair_mask.png", '15'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _productCard(
      String title, String brand, String price, String imagePath) {
    return Stack(
      clipBehavior: Clip.none, // Allows elements to go outside the container
      children: [
        // Main Product Card
        Container(
          width: 120,
          height: 220,
          margin: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Image.asset(imagePath, height: 60),
              SizedBox(height: 5),
              Text(
                title,
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Times New Roman Bold',
                    color: AppColors.primary),
                textAlign: TextAlign.center,
              ),
              Text(
                brand,
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Times New Roman',
                    color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              Text(
                price,
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Times New Roman Bold',
                    color: AppColors.primary),
              ),
            ],
          ),
        ),

        // "New" Badge on Top Left
        Positioned(
          left: 15,
          top: 5,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: Text(
              "New",
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary),
            ),
          ),
        ),

        // Right Side Half Border
        Positioned(
          right: 0, // Align to the right
          top: 30, // Adjusted to be centered in the card
          child: Container(
            width: 1, // Border width
            height: 80, // 50% height of the card
            color: AppColors.primary, // Border color
          ),
        ),
      ],
    );
  }

  Widget _recommendedCard(
    Product product,
  ) {
    return Stack(
      children: [
        Container(
          width: 120,
          margin: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Color(0xffEACDB5),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColors.primary, width: 1, // Bottom border
            ),
          ),
          child: GestureDetector(
            onTap: () {
              Get.to(() => ProductDetailScreen(), arguments: product);
            },
            child: Column(
              children: [
                SizedBox(height: 10),
                Image.asset(product.image, height: 60),
                SizedBox(height: 5),
                Text(product.name,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Times New Roman Bold',
                    )),
                Text(product.brand,
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Times New Roman Bold',
                        color: Colors.grey)),
                Text("\$${product.price.round().toString()}",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Times New Roman Bold',
                        color: AppColors.primary)),
              ],
            ),
          ),
        ),

        // Favorite Heart Icon (Top Right)
        Positioned(
          right: 20,
          top: 10,
          child: Obx(() => GestureDetector(
                onTap: () {
                  controller.toggleFavorite(product.name);
                },
                child: Icon(
                  controller.isFavorite(product.name)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  size: 15,
                  color: controller.isFavorite(product.name)
                      ? AppColors.primary
                      : AppColors.primary,
                ),
              )),
        ),
      ],
    );
  }

  Widget _saleCard(String title, String brand, String price, String imagePath,
      String dicount) {
    return Stack(
      clipBehavior: Clip.none, // Allows elements to go outside the container
      children: [
        // Main Product Card
        Container(
          width: 120,
          height: 220,
          margin: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Image.asset(imagePath, height: 60),
              SizedBox(height: 5),
              Text(
                title,
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Times New Roman Bold',
                    color: AppColors.primary),
                textAlign: TextAlign.center,
              ),
              Text(
                brand,
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Times New Roman',
                    color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              Text(
                price,
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Times New Roman Bold',
                    color: AppColors.primary),
              ),
            ],
          ),
        ),

        // "New" Badge on Top Left
        Positioned(
          left: 15,
          top: 5,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: Text(
              "$dicount % off",
              style: TextStyle(
                  fontSize: 10,
                  fontFamily: 'Times New Roman',
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary),
            ),
          ),
        ),

        // Right Side Half Border
        Positioned(
          right: 0, // Align to the right
          top: 30, // Adjusted to be centered in the card
          child: Container(
            width: 1, // Border width
            height: 80, // 50% height of the card
            color: AppColors.primary, // Border color
          ),
        ),
      ],
    );
  }
}

class Product {
  final String name;
  final String category;
  final String brand;
  final double price;
  final String image;

  Product({
    required this.name,
    required this.category,
    required this.brand,
    required this.price,
    required this.image,
  });
}
