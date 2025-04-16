import 'package:cosmetic_app/constant/constant.dart';
import 'package:cosmetic_app/controller/product_details_controller/product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductDetailController productController =
      Get.put(ProductDetailController());
  final product = Get.arguments;

  final List<Color> availableColors = [
    Color(0xFF64320D),
    Color(0xFFECC9B0),
    Color(0xFFE4BEA7),
    Color(0xFFE0AB8C),
    Color(0xFFDAA283),
    Color(0xFFFFCEB1),
    Color(0xFFDCB28A),
    Color(0xFFFFCB98),
    Color(0xFF95704C),
    Color(0xFFDCB18F),
    Color(0xFFD2AF93),
    Color(0xFFBC9787),
    Color(0xFFC79370),
    Color(0xFFB58368),
    Color(0xFF886754),
    Color(0xFF9B5C2F),
    Color(0xFF321200),
  ];

  @override
  Widget build(BuildContext context) {
    // ✅ Print each value separately
    print(product.category); // ✅ Correct way to access
    print(product.name);
    print(product.price);
    print(product.image);
    // ✅ Combine previous image with new images
    final List<String> productImages = [
      product.image.contains('assets')
          ? product.image
          : 'assets/${product.image}',
      // product.image, // First image from previous screen
      'assets/image1.jpg',
      'assets/image2.jpg',
    ];
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Product Description",
          style: TextStyle(
              fontFamily: 'Times New Roman Bold', color: Color(0xff212121)),
        ),
        backgroundColor: AppColors.background,
        surfaceTintColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      productImages[productController.currentIndex.value],
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),

                    // ✅ Show Back Arrow if not on first image
                    if (productController.currentIndex.value > 0)
                      Positioned(
                        left: 10,
                        bottom: 10,

                        child: Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                            // border:
                            //     Border.all(color: AppColors.primary, width: 1),
                          ),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                productController.previousImage();
                              },
                              child: Icon(
                                Icons.arrow_back,
                                // color: AppColors.primary,
                                size: 18,
                              ),
                            ),
                          ),
                        ),

                        // IconButton(
                        //   icon: Icon(Icons.arrow_back,
                        //       size: 40, color: Colors.black),
                        //   onPressed: () => productController.previousImage(),
                        // ),
                      ),

                    // ✅ Show Forward Arrow unless on last image
                    if (productController.currentIndex.value <
                        productImages.length - 1)
                      Positioned(
                        right: 10,
                        bottom: 10,
                        child: Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                            // border:
                            //     Border.all(color: AppColors.primary, width: 1),
                          ),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                productController.nextImage(productImages);
                              },
                              child: Icon(
                                Icons.arrow_forward,
                                color: AppColors.primary,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                )),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 22,
                      color: Color(0xff6F0000),
                      fontFamily: 'Times New Roman',
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '\$${product.price.round().toString()}', // Dummy price
                    style: TextStyle(
                        fontSize: 26,
                        fontFamily: 'Times New Roman Bold',
                        color: AppColors.primary),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.star, color: AppColors.primary, size: 20),
                      SizedBox(width: 5),
                      Text("4.9 (156)",
                          style: TextStyle(
                              fontSize: 14, color: AppColors.primary)),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "A 24-hour buildable, breathable foundation with a natural, soft-matte finish in 67 good-for-skin shades made for all skin tones and textures.",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Times New Roman',
                        color: Colors.black),
                  ),
                  SizedBox(height: 16),
                  Text("Select your shade",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Times New Roman Bold',
                      )),
                  SizedBox(height: 10),
                  Wrap(
                    children: List.generate(
                      availableColors.length,
                      (index) => Obx(
                        () => GestureDetector(
                          onTap: () => productController.selectColor(index),
                          child: Container(
                            margin: EdgeInsets.all(4),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: availableColors[index],
                              // borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: productController
                                            .selectedColorIndex.value ==
                                        index
                                    ? AppColors.primary
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(height: 16),
                  Text(
                    "Benefits",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "• 98% said it blended easily onto skin\n"
                    "• 94% said it was colour-true\n"
                    "• 91% said it left skin looking natural\n"
                    "• Waterproof\n"
                    "• Transfer-, sweat- and humidity-resistant\n"
                    "• Does not cause acne and does not clog pores\n"
                    "• Oil-free\n"
                    "• SPF 15 for broad spectrum protection against UV rays\n"
                    "• Suitable for sensitive skin\n"
                    "• Long-wearing, non-caking, non-creasing and non-settling for 24 hours",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Times New Roman',
                        color: Colors.black),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Consumer testing on 167 women after using product for one week.",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Times New Roman Italic',
                        color: Colors.black),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.background, // Background color
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.09),
              blurRadius: 10,
              spreadRadius: 3,
            )
          ],
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppColors.primary, width: 2),
                ),
                child: Center(
                  child: InkWell(
                    onTap: productController.toggleFavorite,
                    child: Icon(
                      productController.isFavorite.value
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
            ),
            Obx(() => GestureDetector(
                  onTap: () {
                    productController.toggleCart();
                  },
                  child: Container(
                    width: 285.w,
                    height: 48,
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    //padding: EdgeInsets.symmetric(vertical: 16),
                    // width: double.infinity,
                    decoration: BoxDecoration(
                      color: productController.isAddedToCart.value
                          ? AppColors.primary
                          : AppColors.background // Color when added
                      , // Default color
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: AppColors.primary, width: 2),
                    ),
                    child: Center(
                      child: Text(
                        productController.isAddedToCart.value
                            ? "Added to Cart"
                            : "Add to Cart",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Times New Roman Bold',
                            color: productController.isAddedToCart.value
                                ? Colors.white
                                : AppColors.primary

                            // Text color changes dynamically
                            ),
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );

    // Row(
    //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   children: [
    //     Obx(
    //       () => Container(
    //         height: 40,
    //         width: 40,
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(10),
    //           border:
    //               Border.all(color: AppColors.primary, width: 1),
    //         ),
    //         child: Center(
    //           child: InkWell(
    //             onTap: productController.toggleFavorite,
    //             child: Icon(
    //               productController.isFavorite.value
    //                   ? Icons.favorite
    //                   : Icons.favorite_border,
    //               color: AppColors.primary,
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),

    //     Obx(() => GestureDetector(
    //           onTap: () {
    //             productController.toggleCart();
    //           },
    //           child: Container(
    //             width: 305,
    //             height: 48,
    //             margin: EdgeInsets.all(16),
    //             // padding: EdgeInsets.symmetric(vertical: 16),
    //             // width: double.infinity,
    //             decoration: BoxDecoration(
    //               color: productController.isAddedToCart.value
    //                   ? AppColors.background // Color when added
    //                   : AppColors.primary, // Default color
    //               borderRadius: BorderRadius.circular(30),
    //               border: Border.all(
    //                   color: AppColors.primary, width: 2),
    //             ),
    //             child: Center(
    //               child: Text(
    //                 productController.isAddedToCart.value
    //                     ? "Add to Cart"
    //                     : "Added to Cart",
    //                 style: TextStyle(
    //                     fontSize: 16,
    //                     fontFamily: 'Times New Roman Bold',
    //                     color:
    //                         productController.isAddedToCart.value
    //                             ? AppColors.primary
    //                             : Colors.white
    //                     // Text color changes dynamically
    //                     ),
    //               ),
    //             ),
    //           ),
    //         )),
    //   ],
    // ),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
