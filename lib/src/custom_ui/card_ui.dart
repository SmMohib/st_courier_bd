import 'package:flutter/material.dart';

import '../component/colors/colors.dart';
import '../component/font/font_style.dart';
import '../widgets/vertical_spacing.dart';

// ignore: must_be_immutable
class CardUi extends StatelessWidget {
  CardUi(
      {super.key,
      required this.ordarId,
      required this.userName,
      required this.phone,
      required this.address,
      required this.totalCharge,
      required this.totalcollectAmount,
      required this.parcelBrif,
      required this.buttonText});
  String ordarId,
      userName,
      phone,
      address,
      totalCharge,
      totalcollectAmount,
      parcelBrif,
      buttonText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            child: Card(
              color: whiteColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textPoppins(
                            text: ordarId,
                            color: redColor,
                            isTile: true,
                            fontSize: 24),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.more_vert))
                      ],
                    ),
                    textPoppins(
                        text: userName,
                        color: blackColor,
                        isTile: false,
                        fontSize: 20),
                    VerticalSpacing(5),
                    textPoppins(
                        text: phone,
                        color: blackColor,
                        isTile: false,
                        fontSize: 16),
                    VerticalSpacing(5),
                    textPoppins(
                        text: address,
                        color: blackColor,
                        isTile: false,
                        fontSize: 16),
                    VerticalSpacing(10),
                    rowText(
                        text1: 'Total Charge', text2: '${totalCharge}.00 TK'),
                    rowText(
                        text1: 'Total Collect Amount',
                        text2: '${totalcollectAmount}.00 TK'),
                    rowText(text1: 'Parcel Brief', text2: parcelBrif),
                    MaterialButton(
                      onPressed: () {},
                      child: InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            //DecorationImage
                            border: Border.all(
                              color: primaryColor,
                              width: 1,
                            ), //Border.all
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(
                                color: primaryColor,
                                offset: Offset(
                                  1.5,
                                  1.5,
                                ), //Offset
                              ), //BoxShadow
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ), //BoxShadow
                            ],
                          ), //B
                          width: double.infinity,
                          height: 40,
                          child: Center(
                            child: textPoppins(
                                text: buttonText,
                                color: primaryColor,
                                isTile: false,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

//rowText
rowText({required String text1, required String text2}) {
  return Column(
    children: [
      const VerticalSpacing(5),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 7,
            child: textPoppins(
                text: text1, color: primaryColor, isTile: false, fontSize: 14),
          ),
          Expanded(
            flex: 5,
            child: textPoppins(
                text: (': ${text2}'),
                color: blackColor,
                isTile: false,
                fontSize: 14),
          ),
        ],
      ),
      const Divider(),
    ],
  );
}
