import 'package:flutter/material.dart';
import 'package:st_courier_bd/src/component/colors/colors.dart';
import 'package:st_courier_bd/src/component/font/font_style.dart';

import '../custom_ui/card_ui.dart';

class ReturnCompleteScreen extends StatefulWidget {
  const ReturnCompleteScreen({super.key});
  @override
  State<ReturnCompleteScreen> createState() => _ReturnCompleteScreenState();
}

class _ReturnCompleteScreenState extends State<ReturnCompleteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: textRoboro(
            text: 'Return Complete',
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
              userName: 'Mohiuddin',
              phone: '019876543',
              address: 'Mirpur 1',
              totalCharge: '1,453',
              totalcollectAmount: '1,532',
              parcelBrif: 'Cloth',
              buttonText: 'Exchange With Payment Done');
        },
      ),
    );
  }
}
