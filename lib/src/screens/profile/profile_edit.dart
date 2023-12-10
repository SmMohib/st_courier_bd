import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:st_courier_bd/src/component/colors/colors.dart';
import 'package:st_courier_bd/src/screens/home_screen.dart';
import 'package:st_courier_bd/src/widgets/vertical_spacing.dart';

import '../../custom_ui/custom_button.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final _companyTextController = TextEditingController();
  final _passTextController = TextEditingController();
  final _passFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
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
    return SingleChildScrollView(
        child: Container(
            color: backgroundColor,
            width: double.infinity,
            child: Column(children: [
              Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () {
                        Get.close(0);
                      },
                      icon: Icon(Icons.clear_rounded))),
              const VerticalSpacing(20),
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomRight,
                children: [
                  const CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('assets/images/profilepic.png'),
                  ),
                  Positioned(
                    bottom: 10,
                    right: -10,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.image_sharp,
                        size: 30,
                        color: primaryColor,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          ///Company Name
                          textfill(_companyTextController, 'Company Name',
                              'Company Name'),
                          textfill(_companyTextController, 'Name', 'Name'),
                          textfill(_companyTextController, 'Phone Number',
                              'Phone Number'),
                          textfill(_companyTextController, 'Company Name',
                              'Company Name'),
                          textfill(_companyTextController, 'Company Name',
                              'Company Name'),
                          textfill(_companyTextController, 'Company Name',
                              'Company Name'),
                          textfill(_companyTextController, 'Company Name',
                              'Company Name'),
                          textfill(_companyTextController, 'Company Name',
                              'Company Name'),
                          textfill(_companyTextController, 'Company Name',
                              'Company Name'),

                          // Row(children: [
                          //   Expanded(flex: 2, child: textfill()),
                          //   SizedBox(
                          //     width: 10,
                          //   ),
                          //   Expanded(flex: 2, child: textfill()),
                          // ]),
                          const SizedBox(
                            height: 20,
                          ),

                          //login
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: CustomButton(
                                fct: () {
                                  setState(() {
                                    if (_formKey.currentState!.validate()) {
                                      //check if form data are valid,
                                      Get.toEnd(() => HomeScreen());
                                      // your process task ahed if all data are valid
                                    }
                                  });
                                },
                                text: 'SAVE',
                                color: primaryColor),
                          ),
                        ],
                      ))),
            ])));
    // barrierColor: Colors.red[50],
    // isDismissible: false,
    // shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(35),
    //     side: const BorderSide(
    //         width: 5, color: Colors.black)),
    //enableDrag: false,
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

            labelStyle: const TextStyle(color: primaryColor, fontSize: 18),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
            //counterText: 'Text',

            hintText: hint,
            hintStyle: const TextStyle(
                color: Color.fromARGB(255, 115, 114, 114), fontSize: 18),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
          ),
        ),
        const VerticalSpacing(10),
      ],
    );
  }
}
