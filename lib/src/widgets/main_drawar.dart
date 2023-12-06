import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:st_curier_bd/src/widgets/vertical_spacing.dart';

// ignore: use_key_in_widget_constructors
class MainDrawer extends StatefulWidget {
  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  final _list = [
    {
      'title': 'Add Parcel',
      'icon': Icons.add_to_photos_rounded,
    },
    {
      'title': 'Parcel List',
      'icon': Icons.list_alt_outlined,
    },
    {
      'title': 'Order Traking',
      'icon': Icons.location_pin,
    },
    {
      'title': 'Coverage Area',
      'icon': Icons.public_rounded,
    },
    {
      'title': 'Payment Request List',
      'icon': Icons.payments_outlined,
    },
    {
      'title': 'Payment List',
      'icon': Icons.payment_outlined,
    },
    {
      'title': 'Pickup Parcel List',
      'icon': Icons.moped,
    },
    {
      'title': 'Return Parcel List',
      'icon': Icons.reply_outlined,
    },
    {
      'title': 'Delivery List',
      'icon': Icons.local_shipping_rounded,
    },
    {
      'title': 'Suport',
      'icon': Icons.spatial_audio_off_rounded,
    },
    {
      'title': 'Log Out',
      'icon': Icons.logout,
    },
  ];
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Drawer(
      width: mediaQuery.width * .81,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            // ignore: sized_box_for_whitespace
            Container(
              height: mediaQuery.height * 0.2,
              width: mediaQuery.height * 0.2,
              child: const Image(
                  image: CachedNetworkImageProvider(
                'https://stcourier.stitbd.app/public/uploads/application/1692693950YRInjW3J1USkdT976599.jpg',
              )),
            ),
            const VerticalSpacing(10),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (ctx, index) => InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text(
                      // 'Add Parcel',
                      "${_list[index]['title']}",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    leading: Icon(
                      _list[index]['icon'] as IconData?,
                      color: Colors.brown,
                    ),
                  ),
                ),
                itemCount: _list.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
