import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:st_courier_bd/src/component/colors/colors.dart';
import 'package:st_courier_bd/src/screens/home_screen.dart';
import 'package:st_courier_bd/src/services/auth/loginScreen.dart';
import 'package:st_courier_bd/src/services/auth/registrationScreen.dart';

class App extends StatelessWidget {
  const App({super.key});
  void closeAppUsingSystemPop() {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  void closeAppUsingExit() {
    exit(0);
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: primaryColor),
        backgroundColor: backgroundColor,
        textTheme: const TextTheme(
          headline6: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
          bodyText2: TextStyle(fontSize: 16.0),
        ),
      ),
      debugShowCheckedModeBanner: false,
      getPages: [
        //GetPage(name: "/", page: () => SplashScreen()),
        GetPage(name: "/", page: () => LoginScreen()),
        GetPage(
            name: "/registrationScreen",
            page: () => const RegistrationScreen()),
        GetPage(name: "/Login", page: () => const LoginScreen())
      ],
    );
  }
}
