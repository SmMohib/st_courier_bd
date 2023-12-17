import 'package:flutter/material.dart';

import '../component/colors/colors.dart';
import '../component/font/font_style.dart';

// ignore: must_be_immutable
class CustomContainer extends StatelessWidget {
  CustomContainer({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);
  final String text;

  Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 18, right: 18, top: 5, bottom: 6),
          child: textPoppins(
              text: text, color: whiteColor, isTile: false, fontSize: 20),
        ),
      ),
    );
  }
}

//  decoration: BoxDecoration(
//                   color: whiteColor,
//                   border: Border.all(
//                     color: primaryColor,
//                     width: 0.1,
//                   ), //Border.all
//                   borderRadius: BorderRadius.circular(15),
//                   // ignore: prefer_const_literals_to_create_immutables
//                   boxShadow: [
//                     const BoxShadow(
//                       color: primaryColor,
//                       offset: Offset(
//                         1.0,
//                         1.0,
//                       ), //Offset
//                       blurRadius: 1.0,
//                       spreadRadius: 1.0,
//                     ), //BoxShadow
//                     const BoxShadow(
//                       color: Colors.white,
//                       offset: Offset(0.0, 0.0),
//                       blurRadius: 0.0,
//                       spreadRadius: 0.0,
//                     ), //BoxShadow
//                   ],
//                 ),
