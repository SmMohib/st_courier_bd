import 'package:flutter/material.dart';

import '../component/colors/colors.dart';
import '../component/font/font_style.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.fct,
    required this.text,
    required this.color,
  }) : super(key: key);
  final String text;
  final Function fct;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: color,
        child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              fct();
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 18, right: 18, top: 10, bottom: 10),
              child: Center(
                child: textPoppins(
                    text: text, color: whiteColor, isTile: false, fontSize: 14),
              ),
            )),
      ),
    );
  }
}
