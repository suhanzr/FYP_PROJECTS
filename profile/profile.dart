import 'package:cosmetic_app/constant/constant.dart';
import 'package:cosmetic_app/screens/auth/login.dart';
import 'package:cosmetic_app/screens/auth/reset_password_screen.dart';
import 'package:cosmetic_app/screens/profile/card_details.dart';
import 'package:cosmetic_app/screens/profile/change_address.dart';
import 'package:cosmetic_app/screens/profile/edit_profile.dart';
import 'package:cosmetic_app/screens/profile/order_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 40),
            Text('My Account',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Times New Roman Bold',
                    fontSize: 20)),
            SizedBox(height: 10),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profileimage.png'),
            ),
            SizedBox(height: 10),
            Text(
              'Rose Marry',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'Times New Roman Bold',
                color: AppColors.primary,
              ),
            ),
            Text(
              'marry123@gmail.com',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Times New Roman',
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: 20),
            _buildSectionTitle('Personal Information'),
            _buildMenuItem(Icons.account_circle_outlined, 'Edit Profile',
                route: EditProfileScreen()),
            _buildMenuItem(Icons.location_on_outlined, 'Change Address',
                route: ChangeAddressScreen()),
            _buildMenuItem(Icons.credit_card, 'Card Details',
                route: CardDetailsScreen()),
            Container(
              height: 55,
              margin: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.primary,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                leading: SvgPicture.asset(
                  'assets/password.svg',
                  height: 22,
                ),

  
                title: Text(
                  'Reset Password',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontFamily: 'Times New Roman',
                    fontSize: 16,
                  ),
                ),
                onTap: () {
                  Get.to(ResetPasswordScreen());
                },
              ),
            ),
            // _buildMenuItem(Icons.lock, 'Reset Password',
            //     route: ResetPasswordScreen()),
            SizedBox(height: 20),
            _buildSectionTitle('General Information'),
            _buildMenuItem(Icons.assignment_outlined, 'Order History',
                route: OrderHistoryScreen()),
            SizedBox(height: 20),
            _buildSectionTitle('Settings'),
            _buildMenuItem(
              Icons.notifications_none_rounded,
              ' Notification',
            ),
            _buildMenuItem(
              Icons.privacy_tip_outlined,
              'Privacy Policy',
            ),
            _buildMenuItem(
              Icons.help_outline,
              'Help',
            ),
            _buildMenuItem(Icons.login_outlined, 'Log Out',
                route: LoginScreen()),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Times New Roman Bold',
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, {Widget? route}) {
    return Container(
      height: 55,
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.primary,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: AppColors.primary,
          size: 24,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: AppColors.primary,
            fontFamily: 'Times New Roman',
            fontSize: 16,
          ),
        ),
        onTap: () {
          if (title == 'Log Out') {
            Get.dialog(SuccessDialog());

            Future.delayed(Duration(seconds: 5), () {
              // Close the loading dialog
              Get.offAll(route); // Navigate to the next screen
            });
          } else {
            if (route != null) {
              Get.to(route);
            }
          }
        },
      ),
    );
  }
}

class SuccessDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Align(
            //   alignment: Alignment.topRight,
            //   child: GestureDetector(
            //     onTap: () => Get.back(),
            //     child: Icon(Icons.close, color: Colors.black),
            //   ),
            // ),
            Image.asset(
              'assets/success.gif',
            ),

            Text("Logged out successfully ! ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 16,
                    fontFamily: 'Times New Roman Bold')),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
