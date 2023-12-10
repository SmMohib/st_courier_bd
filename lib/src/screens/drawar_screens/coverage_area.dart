import 'package:flutter/material.dart';
import 'package:st_courier_bd/src/component/colors/colors.dart';
import 'package:st_courier_bd/src/component/font/font_style.dart';

import '../../widgets/vertical_spacing.dart';

class CoverageAreaScreen extends StatefulWidget {
  const CoverageAreaScreen({super.key});

  @override
  State<CoverageAreaScreen> createState() => _CoverageAreaScreenState();
}

class _CoverageAreaScreenState extends State<CoverageAreaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: textRoboro(
            text: 'Coverage Area',
            color: whiteColor,
            isTile: false,
            fontSize: 20),
      ),
      body: ListView.builder(
        itemCount: 10,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  border: Border.all(
                    color: primaryColor,
                    width: 0.12,
                  ), //Border.all
                  borderRadius: BorderRadius.circular(15),
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    const BoxShadow(
                      color: blackColor,
                      offset: Offset(
                        0.0,
                        0.0,
                      ), //Offset
                      blurRadius: 0.1,
                      spreadRadius: 0.1,
                    ), //BoxShadow
                    const BoxShadow(
                      color: Colors.white,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      rowText(text1: 'Area', text2: 'Dhanmondi Rd-3'),
                      rowText(text1: 'District', text2: 'Dhaka'),
                      rowText(text1: 'Parcel: 1', text2: 'Rcv Parcel: 3'),
                      rowText(text1: 'Zip', text2: '1209'),
                      rowText(text1: 'Dervice', text2: 'Dhaka Metro'),
                      rowText(text1: 'COD', text2: '1.5%'),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

//rowText
  rowText({required String text1, required String text2}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 3,
              child: textPoppins(
                  text: text1, color: blackColor, isTile: false, fontSize: 13),
            ),
            Expanded(
              flex: 4,
              child: textPoppins(
                  text: (': ${text2}'),
                  color: blackColor,
                  isTile: false,
                  fontSize: 13),
            ),
          ],
        ),
      ],
    );
  }
}
