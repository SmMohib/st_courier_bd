import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:st_courier_bd/src/component/colors/colors.dart';
import 'package:st_courier_bd/src/component/font/font_style.dart';
import 'package:st_courier_bd/src/screens/Payment_Complete.dart';
import 'package:st_courier_bd/src/screens/cancelParcel.dart';
import 'package:st_courier_bd/src/screens/drawar_screens/add_parcel.dart';
import 'package:st_courier_bd/src/screens/drawar_screens/payment_list.dart';
import 'package:st_courier_bd/src/screens/pending_delivery.dart';
import 'package:st_courier_bd/src/screens/pending_pickup.dart';
import 'package:st_courier_bd/src/screens/profile/profile_screen.dart';
import 'package:st_courier_bd/src/screens/return_complete.dart';
import 'package:st_courier_bd/src/screens/return_parcel.dart';
import 'package:st_courier_bd/src/screens/total_parcel.dart';
import 'package:st_courier_bd/src/shimmer_screen.dart';
import 'package:st_courier_bd/src/custom_ui/custom_button.dart';
import 'package:st_courier_bd/src/widgets/main_drawar.dart';
import 'package:st_courier_bd/src/widgets/text_widget.dart';
import 'package:st_courier_bd/src/widgets/vertical_spacing.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    Future<bool> showExitPopup(context) async {
      return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Container(
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textPoppins(
                        text: 'Do you want to exit?',
                        color: primaryColor,
                        isTile: false,
                        fontSize: 20),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              print('yes selected');
                              exit(0);
                            },
                            child: const Text("Yes"),
                            style:
                                ElevatedButton.styleFrom(primary: primaryColor),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                            child: ElevatedButton(
                          onPressed: () {
                            print('no selected');
                            Navigator.of(context).pop();
                          },
                          child:
                              Text("No", style: TextStyle(color: Colors.black)),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ),
                        ))
                      ],
                    )
                  ],
                ),
              ),
            );
          });
    }

    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: TextWidget(text: 'Dashboard', textSize: 24),
          toolbarHeight: 60,
        ),
        drawer: MainDrawer(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                //profile
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              AssetImage('assets/images/profilepic.png'),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textPoppins(
                                text: 'Mohibbullah',
                                color: primaryColor,
                                isTile: true,
                                fontSize: 16),
                            textPoppins(
                                text: 'Balance: \৳150',
                                color: blackColor,
                                isTile: false,
                                fontSize: 14),
                            textPoppins(
                                text: '0156896843',
                                color: blackColor,
                                isTile: false,
                                fontSize: 14),
                          ],
                        ),
                        CustomButton(
                            fct: () {
                              Get.to(ProfileScreen());
                            },
                            text: 'VIEW PROFILE',
                            color: primaryColor)
                      ],
                    ),
                    const VerticalSpacing(14),
                    Center(
                      child: textPoppins(
                          text: 'Welcome To ST Courier',
                          color: primaryColor,
                          isTile: false,
                          fontSize: 19),
                    ),
                    const VerticalSpacing(10),
                    CustomButton(
                        fct: () {
                          Get.to(AddParcelScreen());
                        },
                        text: 'ADD PARCEL',
                        color: primaryColor),
                    const VerticalSpacing(20),
                  ],
                ),
                //services
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        serviceButton(
                            ontap: () {
                              Get.to(TotalParcel(),
                                  transition: Transition.circularReveal);
                            },
                            img: 'assets/images/totalpearcel.png',
                            title: '  Total \n Parcel',
                            amount: '35'),
                        serviceButton(
                            ontap: () {
                              Get.to(CancelParcel(),
                                  transition: Transition.circularReveal);
                            },
                            img: 'assets/images/cancelled.png',
                            title: ' Cancel \n  Parcel',
                            amount: '3'),
                        serviceButton(
                            ontap: () {
                              Get.to(PendingPickupScreen());
                            },
                            img: 'assets/images/waitingpickup.png',
                            title: 'Pending in\n   Pickup',
                            amount: '34'),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        serviceButton(
                            ontap: () {
                              Get.to(PendingDeliveryScreen());
                            },
                            img: 'assets/images/waitingdelivery.png',
                            title: ' Panding \n Delivery',
                            amount: '35'),
                        serviceButton(
                            ontap: () {},
                            img: 'assets/images/deliverycomplete.png',
                            title: '  Delivery \n Complete',
                            amount: '34'),
                        serviceButton(
                            ontap: () {
                              Get.to(PaymentCompleteScreen());
                            },
                            img: 'assets/images/paymentcomplete.png',
                            title: ' Payment \nComplete',
                            amount: '44'),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        serviceButton(
                            ontap: () {
                              Get.to(ReturnParcelScreen());
                            },
                            img: 'assets/images/returnparcel.png',
                            title: '  Return \n  Parcel',
                            amount: '5'),
                        serviceButton(
                            ontap: () {
                              Get.to(ReturnCompleteScreen());
                            },
                            img: 'assets/images/returncomplete.png',
                            title: '  Return \nComplete',
                            amount: '45'),
                        serviceButton(
                            ontap: () {},
                            img: 'assets/images/pendingamout.png',
                            title: ' Payment In\n Progress',
                            amount: '35'),
                      ],
                    )
                  ],
                ),
                const VerticalSpacing(10),
                //total amount
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    totalButton(
                        ontap: () {},
                        img: 'assets/images/totalamount1.png',
                        title: 'Total Collect Amount',
                        amount: '12,990'),
                    totalButton(
                        ontap: () {
                          Get.to(PaymentListScreen());
                        },
                        img: 'assets/images/cashondelivery.png',
                        title: 'Total Paid Amount',
                        amount: '120,990'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//quantityControl
  Widget quantityControl(
      {required Function fct, required String text, required Color color}) {
    return Flexible(
      flex: 2,
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: color,
        child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              fct();
            },
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 18, right: 18, top: 8, bottom: 8),
              child: TextWidget(
                text: text,
                textSize: 16,
                color: whiteColor,
              ),
            )),
      ),
    );
  }

//servicebutton
  Widget serviceButton(
      {required String img,
      required String title,
      required String amount,
      required Function ontap}) {
    return InkWell(
      onTap: () {
        ontap();
      },
      child: Card(
        child: Container(
          height: 130,
          width: 102,
          decoration: BoxDecoration(
              color: whiteColor, borderRadius: BorderRadius.circular(14)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                  child: Image.asset(
                    img,
                    height: 40,
                    width: 40,
                  ),
                ),
                const VerticalSpacing(6),
                SizedBox(
                  height: 45,
                  child: Text(
                    title!.toString(),
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(
                  height: 26,
                  child: Text(
                    amount!.toString(),
                    style: GoogleFonts.robotoCondensed(
                        color: primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//total Button
  Widget totalButton(
      {required String img,
      required String title,
      required String amount,
      required Function ontap}) {
    return InkWell(
      onTap: () {
        ontap();
      },
      child: Card(
        child: Container(
          decoration: BoxDecoration(
              color: whiteColor, borderRadius: BorderRadius.circular(14)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const VerticalSpacing(10),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Image.asset(
                  img,
                  height: 40,
                  width: 40,
                ),
              ),
              const VerticalSpacing(6),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Text(
                  title.toString(),
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  amount.toString(),
                  style: GoogleFonts.roboto(
                      color: primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
