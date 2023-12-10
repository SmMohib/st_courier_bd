import 'package:flutter/material.dart';

import '../component/colors/colors.dart';
import '../component/font/font_style.dart';

// ignore: must_be_immutable
class AppBar_Ui extends StatelessWidget {
  AppBar_Ui({super.key, required this.title, });
  String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
    
      title: textRoboro(
          text: title, color: whiteColor, isTile: false, fontSize: 20),
    );
  }
}
