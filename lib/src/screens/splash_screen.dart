import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:st_courier_bd/src/widgets/text_widget.dart';
import 'package:st_courier_bd/src/widgets/vertical_spacing.dart';
import '../controller/get_controller.dart';

// ignore: must_be_immutable
class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  String? logo = 'assets/images/logo.png';
  @override
  Widget build(BuildContext context) {
    SplashScreenViewModel splashScreenViewModel =
        Get.put(SplashScreenViewModel());
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: mediaQuery.height * .1,
                  child: Image.asset(
                    logo.toString(),
                  ),
                ),
                Container(
                  height: mediaQuery.height * 0.6,
                  child: Image.asset(
                    'assets/images/pickup.png',
                    //  width: splashScreenViewModel.animation.value * 20,
                    // height: splashScreenViewModel.animation.value * 20,
                  ),
                ),
                Column(
                  children: [
                    TextWidget(
                      text: 'Your Delivery Partner, Always On',
                      textSize: 20,
                      isTitle: true,
                    ),
                    Center(
                      child: TextWidget(
                        text: 'Time',
                        textSize: 20,
                        isTitle: true,
                      ),
                    ),
                    VerticalSpacing(14),
                    TextWidget(text: 'Version 1.01', textSize: 16)
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
