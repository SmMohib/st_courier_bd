import 'package:flutter/material.dart';

import '../component/colors/colors.dart';
import '../component/font/font_style.dart';

// ignore: must_be_immutable
class DeafultButton extends StatelessWidget {
  DeafultButton({super.key, required this.ontap, required this.text});
  Function ontap;
  String text;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        ontap();
      },
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
                  0.2,
                  0.2,
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
          height: 50,
          child: Center(
            child: textPoppins(
                text: text, color: primaryColor, isTile: false, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
