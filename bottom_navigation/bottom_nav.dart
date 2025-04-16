import 'dart:async';

import 'package:cosmetic_app/constant/constant.dart';
import 'package:cosmetic_app/controller/bottom_nav_controller.dart';
import 'package:cosmetic_app/screens/favourites/favourites.dart';
import 'package:cosmetic_app/screens/home/home.dart';
import 'package:cosmetic_app/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({Key? key}) : super(key: key);

  final BottomNavController controller = Get.find<BottomNavController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Obx(
          () => Column(
            children: [
              if (controller.selectedIndex != 2)
                ScrollingText(
                  text: "Free Shipping on all orders above \$100.",
                ),

              // _buildSlidingTextBanner(), // ✅ Sliding Text Banner
              Expanded(
                child: Obx(() => _getPages()[controller.selectedIndex.value]),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomNavBar(),
      ),
    );
  }

  List<Widget> _getPages() {
    return [
      Home(),
      Obx(() => Favourites(
          title: controller.selectedCategory.value == ''
              ? 'Favourites'
              : controller.selectedCategory.value)), // Dynamic category
      Profile(),
    ];
  }

  /// ✅ Bottom Navigation Bar
  Widget _buildBottomNavBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Container(
        width: double.infinity,
        height: 64,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _getNavItems(),
        ),
      ),
    );
  }

  /// ✅ Get navigation items
  List<Widget> _getNavItems() {
    return [
      _buildNavItem(0, Icons.home_outlined, 'Home'),
      _buildNavItem(1, Icons.favorite_border, 'Fav'),
      _buildNavItem(2, Icons.account_circle_outlined, 'Profile'),
    ];
  }

  Widget _buildNavItem(int index, IconData icon, String title) {
    return Obx(() {
      bool isSelected = controller.selectedIndex.value == index;

      return GestureDetector(
        onTap: () => controller.onItemTapped(index),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon, // Example: Icons.favorite
                color: isSelected ? AppColors.primary : Colors.grey,
                size: isSelected ? 32 : 28,
                //  weight: isSelected ? 800 : 400, // Bolder weight when selected
                //   grade: isSelected ? 200 : 0, // Increases thickness
                //  opticalSize: 48, // Adjusts visual appearance for better clarity
              )
            ],
          ),
        ),
      );
    });
  }
}

class ScrollingText extends StatefulWidget {
  final String text;
  final TextStyle? textStyle;
  final Axis scrollAxis;
  final double speed; // Speed in milliseconds

  const ScrollingText({
    Key? key,
    required this.text,
    this.textStyle,
    this.scrollAxis = Axis.horizontal,
    this.speed = 80, // Default scroll speed
  }) : super(key: key);

  @override
  State<ScrollingText> createState() => _ScrollingTextState();
}

class _ScrollingTextState extends State<ScrollingText>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  Timer? _timer;
  final double _scrollStep = 1.5; // Controls smoothness of scrolling

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) => _startScrolling());
  }

  void _startScrolling() {
    _timer = Timer.periodic(Duration(milliseconds: widget.speed.toInt()), (_) {
      if (_scrollController.hasClients) {
        double maxScrollExtent = _scrollController.position.maxScrollExtent;

        if (_scrollController.offset >= maxScrollExtent) {
          // Instead of jumping, shift the position to create an infinite effect
          _scrollController.jumpTo(0.0);
        } else {
          _scrollController.animateTo(
            _scrollController.offset + _scrollStep, // Move smoothly
            duration: Duration(milliseconds: widget.speed.toInt()),
            curve: Curves.linear,
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40, // Fixed height for proper layout
      color: Color(0xffBA9070),
      child: ListView(
        scrollDirection: widget.scrollAxis,
        controller: _scrollController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Row(
            children: [
              _buildScrollingText(),
              // Space between repetitions
              _buildScrollingText(), // Duplicate text for seamless looping

              _buildScrollingText(), // More copies prevent flickering
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildScrollingText() {
    return Text(
      widget.text,
      style: widget.textStyle ??
          TextStyle(
              fontSize: 14, color: Colors.white, fontFamily: 'Times New Roman'),
    );
  }
}
