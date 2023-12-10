import 'package:flutter/material.dart';
import 'package:st_courier_bd/src/component/colors/colors.dart';
import 'package:st_courier_bd/src/component/font/font_style.dart';
import 'package:st_courier_bd/src/custom_ui/custom_button.dart';
import 'package:st_courier_bd/src/custom_ui/custom_container.dart';
import 'package:st_courier_bd/src/custom_ui/Deafult_button.dart';
import 'package:st_courier_bd/src/custom_ui/gradient_button.dart';

import '../../widgets/vertical_spacing.dart';

class AddParcelScreen extends StatefulWidget {
  const AddParcelScreen({super.key});

  @override
  State<AddParcelScreen> createState() => _AddParcelScreenState();
}

class _AddParcelScreenState extends State<AddParcelScreen> {
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
            text: 'Add Parcel', color: whiteColor, isTile: false, fontSize: 20),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const VerticalSpacing(10),
            DeafultButton(ontap: () {}, text: 'Deafult Address'),
            const VerticalSpacing(20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/location.png',
                        height: 20,
                        width: 20,
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(
                        width: 10,
                      ),
                      textPoppins(
                          text: 'You Pickup Address',
                          color: blackColor,
                          isTile: true,
                          fontSize: 16),
                    ],
                  ),
                  textPoppins(
                      text: 'House No 2/3 Dhanmondi 32',
                      color: blackColor,
                      isTile: false,
                      fontSize: 14),
                ],
              ),
            ),
            CustomContainer(text: 'Customer Information', color: primaryColor),
            const VerticalSpacing(10),
            textfill(_companyTextController, 'Customer Name', 'Customer Name'),
            textfill(_companyTextController, 'Phone Number', 'Phone Number'),
            textfill(
                _companyTextController, 'Customer Address', 'Customer Address'),
            textfill(_companyTextController, 'District', 'District'),
            textfill(_companyTextController, 'Customer Area', 'Customer Area'),
            const VerticalSpacing(10),
            CustomContainer(text: 'Parcel Information', color: primaryColor),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: textfill(_companyTextController, 'Merchant Order No',
                        'Merchant Order No'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    flex: 2,
                    child: textfill(_companyTextController, 'Collection No',
                        'Collection No'),
                  )
                ],
              ),
            ),
            const VerticalSpacing(10),
            textfill(_companyTextController, ' Order No', 'Order No'),
            textfill(_companyTextController, 'Product Value (Price)',
                'Product Value (Price)'),
            textfill(_companyTextController, 'Enter Product Description',
                'Enter Product Description'),
            textfill(_companyTextController, 'Remarks', 'Remarks'),
            const VerticalSpacing(10),
            //total charge
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  border: Border.all(
                    color: primaryColor,
                    width: 0.1,
                  ), //Border.all
                  borderRadius: BorderRadius.circular(15),
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    const BoxShadow(
                      color: primaryColor,
                      offset: Offset(
                        1.0,
                        1.0,
                      ), //Offset
                      blurRadius: 1.0,
                      spreadRadius: 1.0,
                    ), //BoxShadow
                    const BoxShadow(
                      color: Colors.white,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      rowTextCharge(text1: 'Collect Amount', text2: '229'),
                      rowTextCharge(text1: 'Weight Charge', text2: '29'),
                      rowTextCharge(text1: 'Delivery Charge', text2: '100'),
                      rowTextCharge(text1: 'COD Charge', text2: '19'),
                      rowTextCharge(text1: 'Total Charge', text2: '190'),
                    ],
                  ),
                ),
              ),
            ),
            const VerticalSpacing(10),
            CustomButton(fct: () {}, text: 'SUBMIT', color: primaryColor),
            const VerticalSpacing(10),
          ],
        ),
      ),
    );
  }

  /// Text Filled
  textfill(TextEditingController controller, String label, String hint) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
      child: Column(
        children: [
          TextFormField(
            controller: controller,
            textInputAction: TextInputAction.next,
            onEditingComplete: () =>
                FocusScope.of(context).requestFocus(_passFocusNode),
            // controller: _emailTextController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            style: const TextStyle(color: primaryColor),
            decoration: InputDecoration(
              fillColor: primaryColor,
              labelText: label,

              labelStyle: const TextStyle(color: primaryColor, fontSize: 16),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
              ),
              //counterText: 'Text',
              hintMaxLines: 5,
              hintText: hint,
              hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 115, 114, 114), fontSize: 16),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
              ),
            ),
          ),
          const VerticalSpacing(10),
        ],
      ),
    );
  }

//delivery charge
  rowTextCharge({required String text1, required String text2}) {
    return Column(
      children: [
        const VerticalSpacing(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 13,
              child: textRoboro(
                  text: text1, color: blackColor, isTile: false, fontSize: 16),
            ),
            Expanded(
              flex: 6,
              child: textRoboro(
                  text: ': ${text2}.00 TK',
                  color: blackColor,
                  isTile: false,
                  fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }
}
