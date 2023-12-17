import 'package:flutter/material.dart';

import '../component/colors/colors.dart';
import '../component/font/font_style.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Container(
            height: 70,
            width: 240,
            decoration: const BoxDecoration(color: buttonColor),
            child: Center(
              child: Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  const CircularProgressIndicator(),
                  const SizedBox(
                    width: 15,
                  ),
                  textPoppins(
                      text: ' Loading... ',
                      color: primaryColor,
                      isTile: false,
                      fontSize: 16)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
