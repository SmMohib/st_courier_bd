import 'package:flutter/material.dart';
import 'package:st_courier_bd/src/component/colors/colors.dart';
import 'package:st_courier_bd/src/component/font/font_style.dart';

import '../custom_ui/card_ui.dart';

class ReturnParcelScreen extends StatefulWidget {
  const ReturnParcelScreen({super.key});

  @override
  State<ReturnParcelScreen> createState() => _ReturnParcelScreenState();
}

class _ReturnParcelScreenState extends State<ReturnParcelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: textRoboro(
            text: 'Return Parcel',
            color: whiteColor,
            isTile: false,
            fontSize: 20),
      ),
      body: ListView.builder(
        itemCount: 10,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return CardUi(
              ordarId: '23245646',
              userName: 'Md. Babul',
              phone: '019876543',
              address: 'Mohammodpur',
              totalCharge: '453',
              totalcollectAmount: '1,232',
              parcelBrif: 'Oil',
              buttonText: 'Return and Payment pending');
        },
      ),
    );
  }
}
