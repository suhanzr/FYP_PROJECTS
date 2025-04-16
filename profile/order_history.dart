import 'package:cosmetic_app/constant/constant.dart';
import 'package:cosmetic_app/controller/order_history_controller/horder_history_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderHistoryScreen extends StatelessWidget {
  final OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        surfaceTintColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "Order History",
          style: TextStyle(
            fontFamily: 'Times New Roman Bold',
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        return ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          itemCount: orderController.orders.length,
          itemBuilder: (context, index) {
            final order = orderController.orders[index];

            return Container(
              margin: EdgeInsets.only(bottom: 12),
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Color(0xffFFEDDE),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    spreadRadius: 1,
                  )
                ],
              ),
              child: Row(
                children: [
                  Image.asset(
                    order.image,
                    height: 110,
                    width: 110,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.name,
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Times New Roman',
                              color: Color(0xff404040)),
                        ),
                        SizedBox(height: 4),
                        Text(
                          order.price,
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Times New Roman Bold',
                              color: Color(0xff404040)),
                        ),
                        SizedBox(height: 2),
                        Text(
                          order.date,
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Times New Roman',
                              color: Color(0xff6F6F6F)),
                        ),
                        SizedBox(height: 6),
                        Text(
                          order.status,
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Times New Roman Bold',
                            color: order.status == "Delivered"
                                ? Colors.green
                                : order.status == "Cancelled"
                                    ? Colors.red
                                    : Color(0xff3C38BF),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
