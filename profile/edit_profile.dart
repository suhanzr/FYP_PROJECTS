import 'package:cosmetic_app/components/Button.dart';
import 'package:cosmetic_app/components/TextInputField.dart';
import 'package:cosmetic_app/constant/constant.dart';
import 'package:cosmetic_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Edit Profile',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Times New Roman Bold',
              fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 10),
            Stack(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/profileimage.png'),
                ),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: Icon(Icons.camera_alt,
                      color: Colors.grey.shade700, size: 20),

                  // CircleAvatar(
                  //   radius: 15,
                  //   backgroundColor: AppColors.background,
                  //   child:
                  //       Icon(Icons.camera_alt, color: Colors.white, size: 15),
                  // ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Name",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Times New Roman Bold',
                      color: AppColors.primary),
                )),
            const SizedBox(height: 10),
            CustomTextField(
              controller: nameController,
              hintText: 'Type Here ..',
              icon: Icon(Icons.account_circle_outlined,
                  size: 20, color: AppColors.primary),
            ),
            SizedBox(height: 20),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email Address",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Times New Roman Bold',
                      color: AppColors.primary),
                )),
            const SizedBox(height: 10),
            CustomTextField(
              controller: nameController,
              hintText: 'Type Here ..',
              keyboardType: TextInputType.emailAddress,
              icon: Icon(Icons.email_outlined,
                  size: 20, color: AppColors.primary),
            ),
            SizedBox(height: 20),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Contact Number",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Times New Roman Bold',
                      color: AppColors.primary),
                )),
            const SizedBox(height: 10),
            CustomTextField(
              controller: nameController,
              hintText: 'Type Here ..',
              keyboardType: TextInputType.emailAddress,
              icon: Icon(Icons.phone_outlined,
                  size: 20, color: AppColors.primary),
            ),
            SizedBox(height: 30),
            CustomButton(
                title: 'Save Changes',
                onPressed: () {
                  Get.toNamed(AppRoutes.bottomNavigation);
                }),
          ],
        ),
      ),
    );
  }
}
