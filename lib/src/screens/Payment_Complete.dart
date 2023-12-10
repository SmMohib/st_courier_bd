import 'package:flutter/material.dart';
import 'package:st_courier_bd/src/component/colors/colors.dart';
import 'package:st_courier_bd/src/component/font/font_style.dart';
import 'package:st_courier_bd/src/custom_ui/gradient_button.dart';

import '../custom_ui/card_ui.dart';
import '../widgets/vertical_spacing.dart';

class PaymentCompleteScreen extends StatefulWidget {
  const PaymentCompleteScreen({super.key});

  @override
  State<PaymentCompleteScreen> createState() => _PaymentCompleteScreenState();
}

class _PaymentCompleteScreenState extends State<PaymentCompleteScreen> {
  final _companyTextController = TextEditingController();
  final _passTextController = TextEditingController();
  final _passFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // ignore: unused_field
  final _obscureText = true;
  @override
  void dispose() {
    _companyTextController.dispose();
    _passTextController.dispose();
    _passFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: textRoboro(
            text: 'Payment Complete',
            color: whiteColor,
            isTile: false,
            fontSize: 20),
      ),
      body: ListView.builder(
        itemCount: 10,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return CardUi(
              ordarId: '23245646',
              userName: 'Mohiuddin',
              phone: '019876543',
              address: 'Mohammodpur',
              totalCharge: '453',
              totalcollectAmount: '1232',
              parcelBrif: 'Cloth',
              buttonText: 'Payment Done');
        },
      ),
    );
  }
}
