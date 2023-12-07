import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:st_curier_bd/src/component/colors/colors.dart';
import 'package:st_curier_bd/src/screens/home_screen.dart';
import 'package:st_curier_bd/src/services/auth/loginScreen.dart';
import 'package:st_curier_bd/src/widgets/text_widget.dart';
import 'package:st_curier_bd/src/widgets/vertical_spacing.dart';

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
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: [
            // ignore: sized_box_for_whitespace
            Flexible(
              flex: 4,
              child: Container(
                height: mediaQuery.height * 0.2,
                width: mediaQuery.height * 0.2,
                child: const Image(
                    image: CachedNetworkImageProvider(
                  'https://stcourier.stitbd.app/public/uploads/application/1692693950YRInjW3J1USkdT976599.jpg',
                )),
              ),
            ),

            Flexible(
              flex: 15,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  list(
                      fct: () {},
                      text: 'Add Parcel',
                      icon: const Icon(
                        Icons.add_to_photos_rounded,
                      )),
                  list(
                      fct: () {},
                      text: 'Parcel List',
                      icon: const Icon(
                        Icons.list_alt_sharp,
                      )),
                  list(
                      fct: () {},
                      text: 'Order Traking',
                      icon: const Icon(
                        Icons.location_pin,
                      )),
                  list(
                      fct: () {},
                      text: 'Coverage Area',
                      icon: const Icon(
                        Icons.public_rounded,
                      )),
                  list(
                      fct: () {},
                      text: 'Payment Request List',
                      icon: const Icon(
                        Icons.payment_outlined,
                      )),
                  list(
                      fct: () {},
                      text: 'Payment List',
                      icon: const Icon(
                        Icons.payments_sharp,
                      )),
                  list(
                      fct: () {},
                      text: 'Pickup Parcel List',
                      icon: const Icon(
                        Icons.moped,
                      )),
                  list(
                      fct: () {},
                      text: 'Return Parcel List',
                      icon: const Icon(
                        Icons.reply_outlined,
                      )),
                  list(
                      fct: () {},
                      text: 'Delivery List',
                      icon: const Icon(
                        Icons.local_shipping_rounded,
                      )),
                  list(
                      fct: () {},
                      text: 'Suport',
                      icon: const Icon(
                        Icons.spatial_audio_off_rounded,
                      )),
                  list(
                      fct: () {
                        Get.to(
                          LoginScreen(),
                        );
                      },
                      text: 'Log Out',
                      icon: const Icon(
                        Icons.logout,
                      )),
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
      {required Function fct, required String text, required Icon icon}) {
    return ListTile(
      hoverColor: greyColor,
      title: TextWidget(
        text: text,
        textSize: 16,
        color: primaryColor,
      ),
      leading: Icon(
        icon.icon,
        color: primaryColor,
      ),
      onTap: () {
        fct();
      },
    );
  }
}
