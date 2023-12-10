import 'package:flutter/material.dart';

import '../component/colors/colors.dart';
import '../component/font/font_style.dart';

// ignore: must_be_immutable
class GradientButton extends StatelessWidget {
  GradientButton({super.key, required this.text, required this.ontap});
  String text;
  Function ontap;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        ontap();
      },
      child: Container(
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xff374ABE), Color(0xff64B6FF)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(10.0)),
        child: Container(
            constraints: const BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: textPoppins(
                text: text,
                color: whiteColor,
                isTile: false,
                fontSize: 20)),
      ),
    );
  }

}
