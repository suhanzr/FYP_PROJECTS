import 'package:cosmetic_app/components/TextInputField.dart';
import 'package:cosmetic_app/constant/constant.dart';
import 'package:cosmetic_app/controller/favourite_controller/favourite_controller.dart';
import 'package:cosmetic_app/screens/favourites/product_details.dart';

import 'package:cosmetic_app/screens/home/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Favourites extends StatelessWidget {
  final String title;
  final FavouritesController controller = Get.put(FavouritesController());

  // ignore: non_constant_identifier_names
  Favourites({required this.title}) {
    controller.pageTitle.value = title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      // appBar: AppBar(
      //   backgroundColor: AppColors.background,
      //   surfaceTintColor: AppColors.background,
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 330.w,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CustomTextField(
                      onChanged: (value) =>
                          controller.searchQuery.value = value,
                      hintText: 'Search here',
                      icon: Icon(Icons.search),
                      keyboardType: TextInputType.text,
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
            SizedBox(height: 10),
            Obx(() => SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      'All',
                      'Makeup',
                      'Skincare',
                      'Hair Care',
                      'Fragrances'
                    ]
                        .map((subCategory) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: GestureDetector(
                                onTap: () => controller
                                    .selectedSubCategory.value = subCategory,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 3, horizontal: 16),
                                  decoration: BoxDecoration(
                                    color:
                                        controller.selectedSubCategory.value ==
                                                subCategory
                                            ? Color(0xFFCE9183)
                                            : Colors.transparent,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: controller
                                                  .selectedSubCategory.value ==
                                              subCategory
                                          ? Color(0xFFCE9183)
                                          : AppColors.primary,
                                    ),
                                  ),
                                  child: Text(
                                    subCategory,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Times New Roman',
                                      color: controller
                                                  .selectedSubCategory.value ==
                                              subCategory
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
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Times New Roman Bold',
                    color: AppColors.primary),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Obx(
                () => GridView.builder(
                  itemCount: controller.filteredProducts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    var product = controller.filteredProducts[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => ProductDetailScreen(), arguments: product);
                      },
                      child: Card(
                        color: AppColors.background,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(
                            color: AppColors.primary,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  clipBehavior: Clip
                                      .none, // Allows positioning outside the Stack if needed
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Image.asset(
                                          'assets/${product.image}',
                                          height: 80),
                                    ),
                                    // "New" Badge on Top Left
                                    if (product.discount != null)
                                      Positioned(
                                        right: 60,
                                        top: 20,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 2),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Colors.black, width: 1),
                                          ),
                                          child: Text(
                                            "${product.discount?.round().toString()} % off",
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontFamily: 'Times New Roman',
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.primary),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                Obx(() => Align(
                                      alignment: Alignment.topRight,
                                      child: IconButton(
                                        icon: controller.pageTitle.value ==
                                                'Favourites'
                                            ? Icon(Icons.favorite,
                                                color: AppColors.primary)
                                            : Icon(
                                                product.isFavourites.value
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                color: AppColors.primary),
                                        onPressed: () =>
                                            product.isFavourites.value =
                                                !product.isFavourites.value,
                                      ),
                                    )),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(product.name,
                                      style: TextStyle(
                                          fontFamily: 'Times New Roman Bold',
                                          color: Color(0xff1A1A1A),
                                          fontSize: 14)),
                                  Text(product.brand,
                                      style: TextStyle(
                                          fontFamily: 'Times New Roman Bold',
                                          color: Color(0xff4D4C4C),
                                          fontSize: 14)),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  SizedBox(
                                    width: 170.w,
                                    child: Row(
                                      children: [
                                        // Text(
                                        //   product.discount != null
                                        //       ? '\$${product.price - (product.price * (product.discount! / 100))}  \$${product.price}'
                                        //       : '\$${product.price}',
                                        //   style: TextStyle(
                                        //       color: product.discount != null
                                        //           ? Colors.red
                                        //           : AppColors.primary,
                                        //       fontFamily: 'Times New Roman Bold',
                                        //       fontSize: 18,
                                        //       decoration: product.discount != null
                                        //           ? TextDecoration.lineThrough
                                        //           : null),
                                        // ),

                                        // UI Update: RichText for Discount and Actual Price
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              if (product.discount != null) ...[
                                                TextSpan(
                                                  text:
                                                      '\$${((product.price - (product.price * (product.discount! / 100))).round()).toString()} ',
                                                  style: TextStyle(
                                                      color: AppColors.primary,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                TextSpan(
                                                  text:
                                                      '\$${product.price.round().toString()}',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black,
                                                      decoration: TextDecoration
                                                          .lineThrough),
                                                ),
                                              ] else ...[
                                                TextSpan(
                                                  text:
                                                      '\$${product.price.round().toString()}',
                                                  style: TextStyle(
                                                      color: AppColors.primary,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ]
                                            ],
                                          ),
                                        ),
                                        product.discount != null
                                            ? SizedBox(
                                                width: 33,
                                              )
                                            : SizedBox(
                                                width: 50,
                                              ),

                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () => product
                                                      .quantity.value =
                                                  (product.quantity.value > 0)
                                                      ? product.quantity.value -
                                                          1
                                                      : 0,
                                              child: Icon(
                                                Icons.remove_circle_outline,
                                                color: AppColors.primary,
                                                size: 18,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Obx(() => Text(product
                                                .quantity.value
                                                .toString())),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            InkWell(
                                              onTap: () =>
                                                  product.quantity.value++,
                                              child: Icon(
                                                Icons
                                                    .add_circle_outline_outlined,
                                                color: AppColors.primary,
                                                size: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
