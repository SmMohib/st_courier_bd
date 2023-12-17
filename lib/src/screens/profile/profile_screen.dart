import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:st_courier_bd/src/component/colors/colors.dart';
import 'package:st_courier_bd/src/component/font/font_style.dart';
import 'package:st_courier_bd/src/screens/profile/profile_edit.dart';
import 'package:st_courier_bd/src/services/auth/change_password.dart';
import 'package:st_courier_bd/src/custom_ui/custom_button.dart';
import 'package:st_courier_bd/src/widgets/text_widget.dart';
import 'package:st_courier_bd/src/widgets/vertical_spacing.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: TextWidget(text: 'My Profile', textSize: 20),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //heder
            Container(
              decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
              width: double.infinity,
              child: Column(
                children: [
                  const VerticalSpacing(35),
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/profilepic.png'),
                  ),
                  const VerticalSpacing(16),
                  textPoppins(
                      text: 'Mohibbullah',
                      color: whiteColor,
                      isTile: true,
                      fontSize: 16),
                  textPoppins(
                      text: 'Balance: \৳150',
                      color: whiteColor,
                      isTile: false,
                      fontSize: 14),
                  textPoppins(
                      text: '0156896843',
                      color: whiteColor,
                      isTile: false,
                      fontSize: 14),
                  const VerticalSpacing(25)
                ],
              ),
            ),
            const VerticalSpacing(20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Profile Information
                  rowTextWithLogo(
                      text: 'Profile Information',
                      icon: const Icon(
                        Icons.edit_document,
                        size: 23,
                      ),
                      onTap: () {
                        setState(() {
                          Get.bottomSheet(
                            const ProfileEditScreen(),
                            //   barrierColor: Colors.red[50],
                            isDismissible: false,
                            // shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(35),
                            //     side: const BorderSide(
                            //         width: 5, color: Colors.black)),
                            enableDrag: false,
                          );
                        });
                      }),

                  rowText(text1: 'Merchant Id', text2: 'M100001'),
                  rowText(text1: 'Company Name', text2: '10MS'),
                  rowText(text1: 'Email', text2: 'smmohib12@gmail.com'),
                  rowText(text1: 'COD Charge', text2: '0.00'),
                  rowText(text1: 'Website', text2: 'Add Link'),
                  const VerticalSpacing(20),
                  //Picup Information
                  rowTextWithLogo(
                      text: 'Picup Information',
                      icon: const Icon(
                        Icons.location_pin,
                        size: 25,
                      ),
                      onTap: () {}),
                  rowText(text1: 'Address', text2: '3/A Dhanmondi 32,Dhaka,'),
                  //Payment Information
                  rowTextWithLogo(
                      text: 'Payment Information',
                      icon: const Icon(
                        Icons.edit_document,
                        size: 24,
                      ),
                      onTap: () {}),
                  rowText(text1: 'Bank Name', text2: 'Brack Bank'),
                  rowText(text1: 'Bank Account', text2: '2345 5354 1422 4565'),
                  rowText(text1: 'Bank Account Name', text2: 'smmohib'),
                  rowText(text1: 'Bksh', text2: '01700000000'),
                  rowText(text1: 'Nagad', text2: '01'),
                  rowText(text1: 'Rocket', text2: '01'),
                ],
              ),
            ),
            const VerticalSpacing(25),
            Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    textPoppins(
                        text: 'Delivery Charge',
                        color: blackColor,
                        isTile: false,
                        fontSize: 20),
                    rowTextCharge(text1: 'Dhaka Metro', text2: '50 TK'),
                    rowTextCharge(text1: 'Dhaka Sub', text2: '80 TK'),
                    rowTextCharge(text1: 'Dhaka Outside', text2: '100 TK'),
                  ],
                )),
            const VerticalSpacing(25),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                  fct: () {
                    Get.to(const ChangePasswordScreen());
                  },
                  text: 'Change Password',
                  color: primaryColor),
            ),
            const VerticalSpacing(25)
          ],
        ),
      ),
    );
  }

//rowText
  rowText({required String text1, required String text2}) {
    return Column(
      children: [
        const VerticalSpacing(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 5,
              child: textRoboro(
                  text: text1,
                  color: primaryColor,
                  isTile: false,
                  fontSize: 16),
            ),
            Expanded(
              flex: 6,
              child: textRoboro(
                  text: ": ${text2}",
                  color: blackColor,
                  isTile: false,
                  fontSize: 16),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }

  ///  rowTextWithLogo
  rowTextWithLogo(
      {required String text, required Icon icon, required Function onTap}) {
    return Column(
      children: [
        const VerticalSpacing(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            textRoboro(
                text: text, color: blackColor, isTile: false, fontSize: 22),
            IconButton(
              onPressed: () {
                onTap();
              },
              icon: icon,
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }

//delivery charge
  rowTextCharge({required String text1, required String text2}) {
    return Column(
      children: [
        const VerticalSpacing(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 2,
              child: textRoboro(
                  text: text1,
                  color: primaryColor,
                  isTile: false,
                  fontSize: 16),
            ),
            Expanded(
              flex: 4,
              child: textRoboro(
                  text: ': ${text2}',
                  color: blackColor,
                  isTile: false,
                  fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }
}
