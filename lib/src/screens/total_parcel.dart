import 'package:flutter/material.dart';
import 'package:st_courier_bd/src/component/colors/colors.dart';
import 'package:st_courier_bd/src/component/font/font_style.dart';
import 'package:st_courier_bd/src/custom_ui/gradient_button.dart';

import '../custom_ui/card_ui.dart';
import '../widgets/vertical_spacing.dart';

class TotalParcel extends StatefulWidget {
  const TotalParcel({super.key});

  @override
  State<TotalParcel> createState() => _TotalParcelState();
}

class _TotalParcelState extends State<TotalParcel> {
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
            text: 'Total Parcel',
            color: whiteColor,
            isTile: false,
            fontSize: 20),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                flex: 7,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    MaterialButton(
                      onPressed: () {},
                      child: InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            //DecorationImage
                            border: Border.all(
                              color: primaryColor,
                              width: 1,
                            ), //Border.all
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(
                                color: primaryColor,
                                offset: Offset(
                                  0.2,
                                  0.2,
                                ), //Offset
                              ), //BoxShadow
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ), //BoxShadow
                            ],
                          ), //B
                          width: double.infinity,
                          height: 50,
                          child: Center(
                            child: textPoppins(
                                text: 'Parcel Status',
                                color: primaryColor,
                                isTile: false,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 12),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 2,
                            child: textfill(_companyTextController,
                                'Invoice No', 'Invoice No'),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            flex: 2,
                            child: textfill(
                                _companyTextController, 'Order No', 'Order No'),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 2,
                            child: textfill(_companyTextController, 'From Date',
                                'From Date'),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            flex: 2,
                            child: textfill(
                                _companyTextController, 'To Date', 'To Date'),
                          ),
                        ],
                      ),
                    ),
                    const VerticalSpacing(10),
                    GradientButton(text: 'FILTER', ontap: () {}),
                    const VerticalSpacing(10),
                  ],
                )),
            Expanded(
              flex: 9,
              child: ListView.builder(
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
                      parcelBrif: '12',
                      buttonText: 'Pickup Request');
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Text Filled
  textfill(TextEditingController controller, String label, String hint) {
    return Column(
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
    );
  }
}
