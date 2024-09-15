import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
import 'package:st_courier_bd/src/custom_ui/custom_button.dart';
import 'package:st_courier_bd/src/widgets/cardTile.dart';
import 'package:st_courier_bd/src/widgets/main_drawar.dart';
import 'package:st_courier_bd/src/widgets/text_widget.dart';
import 'package:st_courier_bd/src/widgets/vertical_spacing.dart';

class DashbordScreen extends StatefulWidget {
  DashbordScreen({
    super.key,
  });

  @override
  State<DashbordScreen> createState() => _DashbordScreenState();
}

class _DashbordScreenState extends State<DashbordScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
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
                                ElevatedButton.styleFrom(backgroundColor: primaryColor),
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
                            backgroundColor: Colors.white,
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
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                color: primaryColor,
                borderRadius: BorderRadius.circular(12),
                child: InkWell(
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/profilepic.png'),
                  ),
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    Get.to(ProfileScreen());
                  },
                ),
              ),
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                //profile
                Column(
                  children: [
                    Center(
                      child: textPoppins(
                          text: 'Welcome To ST Courier',
                          color: primaryColor,
                          isTile: false,
                          fontSize: 19),
                    ),
                    // CustomButton(
                    //     fct: () {
                    //       Get.to(AddParcelScreen());
                    //     },
                    //     text: 'ADD PARCEL',
                    //     color: primaryColor),

                    const VerticalSpacing(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CardTile(
                          onTap: () {},
                          title: 'Total \nPatcel',
                          img: 'assets/images/totalpearcel.png',
                          iconBgColor: redColor,
                          count: '30',
                          subText: 'Today Total Parcel',
                          parcent: '54',
                        ),
                        CardTile(
                          onTap: () {},
                          img: 'assets/images/cancelled.png',
                          title: 'Cancel \nParcel',
                          iconBgColor: tabColor,
                          count: '30',
                          subText: 'Today Total Parcel',
                          parcent: '24',
                        ),
                      ],
                    ),
                    VerticalSpacing(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CardTile(
                          onTap: () {},
                          img: 'assets/images/waitingpickup.png',
                          title: 'Pending \nPickup',
                          iconBgColor: chatBarMessage,
                          count: '30',
                          subText: 'Today Total Parcel',
                          parcent: '54',
                        ),
                        CardTile(
                          onTap: () {},
                          img: 'assets/images/cancelled.png',
                          title: 'Cancel \nParcel',
                          iconBgColor: buttonColor,
                          count: '30',
                          subText: 'Today Total Parcel',
                          parcent: '24',
                        ),
                      ],
                    ),
                    const VerticalSpacing(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CardTile(
                          onTap: () {
                            Get.to(PendingPickupScreen());
                          },
                          img: 'assets/images/waitingpickup.png',
                          title: 'Pending \nPickup',
                          iconBgColor: blueColor,
                          count: '30',
                          subText: 'Today Total Parcel',
                          parcent: '54',
                        ),
                        CardTile(
                          onTap: () {
                            Get.to(PendingDeliveryScreen());
                          },
                          img: 'assets/images/waitingdelivery.png',
                          title: 'Panding \nDelivery',
                          iconBgColor: redColor,
                          count: '30',
                          subText: 'Today Total Parcel',
                          parcent: '24',
                        ),
                      ],
                    ),
                    const VerticalSpacing(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CardTile(
                          onTap: () {},
                          img: 'assets/images/deliverycomplete.png',
                          title: 'Delivery\nComplete',
                          iconBgColor: pinkColor,
                          count: '30',
                          subText: 'Today Total Parcel',
                          parcent: '54',
                        ),
                        CardTile(
                          onTap: () {
                            Get.to(PaymentCompleteScreen());
                          },
                          img: 'assets/images/paymentcomplete.png',
                          title: 'Payment \nComplete',
                          iconBgColor: brownColor,
                          count: '30',
                          subText: 'Today Total Parcel',
                          parcent: '24',
                        ),
                      ],
                    ),
                    const VerticalSpacing(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CardTile(
                          onTap: () {
                            Get.to(ReturnParcelScreen());
                          },
                          img: 'assets/images/returnparcel.png',
                          title: 'Return \nParcel',
                          iconBgColor: greenColor,
                          count: '30',
                          subText: 'Today Total Parcel',
                          parcent: '54',
                        ),
                        CardTile(
                          onTap: () {
                            Get.to(ReturnCompleteScreen());
                          },
                          img: 'assets/images/returncomplete.png',
                          title: 'Return \nComplete',
                          iconBgColor: redColor,
                          count: '30',
                          subText: 'Today Total Parcel',
                          parcent: '24',
                        ),
                      ],
                    ),
                    const VerticalSpacing(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CardTile(
                          onTap: () {},
                          img: 'assets/images/pendingamout.png',
                          title: ' Payment In\n Progress',
                          iconBgColor: redColor,
                          count: '30',
                          subText: 'Today Total Parcel',
                          parcent: '54',
                        ),
                        CardTile(
                          onTap: () {
                            Get.to(PaymentCompleteScreen());
                          },
                          img: 'assets/images/paymentcomplete.png',
                          title: 'Payment \nComplete',
                          iconBgColor: greyColor,
                          count: '30',
                          subText: 'Today Total Parcel',
                          parcent: '24',
                        ),
                      ],
                    ),
                    const VerticalSpacing(10),
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
                        title: '           Total \nCollect Amount',
                        amount: '12,990'),
                    totalButton(
                        ontap: () {
                          Get.to(PaymentListScreen());
                        },
                        img: 'assets/images/cashondelivery.png',
                        title: '       Total \nPaid Amount',
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
                    child: CircleAvatar(
                      backgroundColor: primaryColor,
                      radius: 50,
                      child: Image.asset(
                        img,
                        height: 30,
                        width: 30,
                      ),
                    )),
                const VerticalSpacing(6),
                SizedBox(
                  height: 45,
                  child: Text(
                    title.toString(),
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(
                  height: 26,
                  child: Text(
                    amount.toString(),
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
          height: 180,
          width: 150,
          decoration: BoxDecoration(
              color: whiteColor, borderRadius: BorderRadius.circular(14)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const VerticalSpacing(10),
              Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: CircleAvatar(
                    backgroundColor: appBarColor,
                    radius: 25,
                    child: Image.asset(
                      img,
                      height: 26,
                      width: 26,
                    ),
                  )),
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
