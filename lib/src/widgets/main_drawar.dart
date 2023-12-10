import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:st_courier_bd/src/component/colors/colors.dart';
import 'package:st_courier_bd/src/screens/drawar_screens/add_parcel.dart';
import 'package:st_courier_bd/src/screens/drawar_screens/coverage_area.dart';
import 'package:st_courier_bd/src/screens/drawar_screens/delivery_list.dart';
import 'package:st_courier_bd/src/screens/drawar_screens/parcel_track.dart';
import 'package:st_courier_bd/src/screens/drawar_screens/payment_list.dart';
import 'package:st_courier_bd/src/screens/drawar_screens/payment_request_list.dart';
import 'package:st_courier_bd/src/screens/drawar_screens/pickup_parcel_list.dart';
import 'package:st_courier_bd/src/screens/total_parcel.dart';
import 'package:st_courier_bd/src/services/auth/loginScreen.dart';
import 'package:st_courier_bd/src/widgets/text_widget.dart';

// ignore: use_key_in_widget_constructors
class MainDrawer extends StatefulWidget {
  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Drawer(
      width: mediaQuery.width * .81,
      child: Padding(
        padding: EdgeInsets.all(3.0),
        child: Column(
          children: [
            // ignore: sized_box_for_whitespace
            Flexible(
              flex: 4,
              child: Container(
                height: mediaQuery.height * 0.2,
                width: mediaQuery.height * 0.2,
                child: Image.asset('assets/images/logo.png'),
              ),
            ),

            Flexible(
              flex: 15,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  list(
                      fct: () {
                        Get.to(AddParcelScreen());
                      },
                      text: 'Add Parcel',
                      icon: 'assets/images/add_parcel_drawer.png'),
                  list(
                      fct: () {
                        Get.to(TotalParcel());
                      },
                      text: 'Parcel List',
                      icon: 'assets/images/total_parcel_d.png'),
                  list(
                      fct: () {
                        Get.to(ParcelTrackScreen());
                      },
                      text: 'Order Traking',
                      icon: 'assets/images/track.png'),
                  list(
                      fct: () {
                        Get.to(CoverageAreaScreen());
                      },
                      text: 'Coverage Area',
                      icon: 'assets/images/coverage.png'),
                  list(
                      fct: () {
                        Get.to(PaymentRequestListScreen());
                      },
                      text: 'Payment Request List',
                      icon: 'assets/images/payment.png'),
                  list(
                      fct: () {
                        Get.to(PaymentListScreen());
                      },
                      text: 'Payment List',
                      icon: 'assets/images/payment.png'),
                  list(
                      fct: () {
                        Get.to(PickupParcelList());
                      },
                      text: 'Pickup Parcel List',
                      icon: 'assets/images/pickup.png'),
                  list(
                      fct: () {},
                      text: 'Return Parcel List',
                      icon: 'assets/images/returnparcel1.png'),
                  list(
                      fct: () {
                        Get.to(DeliveryParcelList());
                      },
                      text: 'Delivery List',
                      icon: 'assets/images/total_parcel_d.png'),
                  list(
                      fct: () {},
                      text: 'Suport',
                      icon: 'assets/images/support.png'),
                  list(
                      fct: () {
                        Get.to(
                          LoginScreen(),
                        );
                      },
                      text: 'Log Out',
                      icon: 'assets/images/logout.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

////List
  Widget list(
      {required Function fct, required String text, required String icon}) {
    return Column(
      children: [
        ListTile(
          hoverColor: greyColor,
          title: TextWidget(
            text: text,
            textSize: 16,
            color: primaryColor,
          ),
          leading: Image.asset(
            icon,
            height: 25,
            width: 25,
          ),
          onTap: () {
            fct();
          },
        ),
        Divider()
      ],
    );
  }
}
