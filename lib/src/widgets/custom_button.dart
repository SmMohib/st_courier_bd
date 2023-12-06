import 'package:flutter/material.dart';
import 'package:st_curier_bd/src/widgets/text_widget.dart';
import '../component/colors/colors.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton(
      {Key? key, required this.fct, required this.text, required this.color})
      : super(key: key);
  final String text;
  final Function fct;
  Color color;


  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      color: color,
      child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            fct();
          },
          child: Padding(
            padding:
                const EdgeInsets.only(left: 18, right: 18, top: 8, bottom: 8),
            child: Center(
              child: TextWidget(
                text: text,
                textSize: 16,
                color: whiteColor,
              ),
            ),
          )),
    );
  }
}
