import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:st_courier_bd/src/component/colors/colors.dart';
import 'package:st_courier_bd/src/custom_ui/dashbord.dart';
import 'package:st_courier_bd/src/screens/drawar_screens/add_parcel.dart';
import 'package:st_courier_bd/src/screens/drawar_screens/coverage_area.dart';
import 'package:st_courier_bd/src/screens/home_screen.dart';
import 'package:st_courier_bd/src/services/api/api_data.dart';
import 'package:st_courier_bd/src/services/api/api_screen.dart';
import 'package:st_courier_bd/src/services/api/apitest.dart';
import 'package:st_courier_bd/src/services/api/controller/authAcreen.dart';
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
        GetPage(name: "/", page: () => AddParcelScreen()),
        GetPage(
            name: "/registrationScreen",
            page: () => const RegistrationScreen()),
        GetPage(name: "/Login", page: () => const LoginScreen())
      ],
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();
  TextEditingController textController3 = TextEditingController();

  int sum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Summation'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: textController1,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Number One'),
            onChanged: (text) {
              updateSum();
            },
          ),
          TextField(
            controller: textController2,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Number Two'),
            onChanged: (text) {
              updateSum();
            },
          ),
          TextField(
            controller: textController3,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Number Three'),
            onChanged: (text) {
              updateSum();
            },
          ),
          SizedBox(height: 20),
          Text('Sum: $sum'),
        ],
      ),
    );
  }

  void updateSum() {
    // Calculate the sum of the three numbers
    int num1 = int.tryParse(textController1.text) ?? 0;
    int num2 = int.tryParse(textController2.text) ?? 0;
    int num3 = int.tryParse(textController3.text) ?? 0;

    setState(() {
      sum = num1 + num2 + num3;
    });
  }

  @override
  void dispose() {
    // Dispose the controllers when the widget is disposed
    textController1.dispose();
    textController2.dispose();
    textController3.dispose();
    super.dispose();
  }
}


class MyHomePage1 extends StatefulWidget {
  @override
  _MyHomePage1State createState() => _MyHomePage1State();
}

class _MyHomePage1State extends State<MyHomePage1> {
  TextEditingController _price2TextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Total Charge Calculation'),
      ),
      body: Column(
        children: [
          rowTextCharge(
            text1: 'Collect Amount',
            text2: '${_price2TextController.text}',
          ),
          rowTextCharge(text1: 'Weight Charge', text2: '29'),
          rowTextCharge(text1: 'Delivery Charge', text2: '100'),
          rowTextCharge(text1: 'COD Charge', text2: '19'),
          rowTextCharge(
            text1: 'Total Charge',
            text2: calculateTotalCharge(),
          ),
        ],
      ),
    );
  }

  String calculateTotalCharge() {
    // Calculate the sum of charges dynamically
    int collectAmount = int.tryParse(_price2TextController.text) ?? 0;
    int weightCharge = 29;
    int deliveryCharge = 100;
    int codCharge = 19;

    int totalCharge = collectAmount + weightCharge + deliveryCharge + codCharge;

    return totalCharge.toString();
  }

  Widget rowTextCharge({required String text1, required String text2}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text1),
        Text(text2),
      ],
    );
  }
}
