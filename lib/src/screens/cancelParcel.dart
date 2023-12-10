import 'package:flutter/material.dart';
import 'package:st_courier_bd/src/component/colors/colors.dart';
import 'package:st_courier_bd/src/component/font/font_style.dart';
import 'package:st_courier_bd/src/custom_ui/gradient_button.dart';

import '../custom_ui/card_ui.dart';
import '../widgets/vertical_spacing.dart';

class CancelParcel extends StatefulWidget {
  const CancelParcel({super.key});

  @override
  State<CancelParcel> createState() => _CancelParcelState();
}

class _CancelParcelState extends State<CancelParcel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: textRoboro(
            text: 'Cancel Parcel',
            color: whiteColor,
            isTile: false,
            fontSize: 20),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 10,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return CardUi(
                ordarId: '23245646',
                userName: 'Mohiuddin',
                phone: '019876543',
                address: 'Mohammodpur',
                totalCharge: '453',
                totalcollectAmount: '1232',
                parcelBrif: '12',
                buttonText: 'Parcel Cancel');
          },
        ),
      ),
    );
  }
}
