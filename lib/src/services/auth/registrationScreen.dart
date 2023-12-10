import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:st_courier_bd/src/component/colors/colors.dart';
import 'package:st_courier_bd/src/services/auth/forget_password.dart';
import 'package:st_courier_bd/src/services/auth/loginScreen.dart';
import 'package:st_courier_bd/src/custom_ui/custom_button.dart';
import 'package:st_courier_bd/src/widgets/text_widget.dart';
import 'package:st_courier_bd/src/widgets/textfill_widget.dart';
import 'package:st_courier_bd/src/widgets/vertical_spacing.dart';
import 'package:get/get.dart';

import '../../component/font/font_style.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _companyNameTextController = TextEditingController();
  final _yourNameTextController = TextEditingController();
  final _addressTextController = TextEditingController();
  final _websiteTextController = TextEditingController();
  final _numberTextController = TextEditingController();
  final _passTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _pass2TextController = TextEditingController();

  final _passFocusNode = FocusNode();
  final _pass2FocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  var _obscureText = true;
  var _obscureText2 = true;
  @override
  void dispose() {
    _companyNameTextController.dispose();
    _yourNameTextController.dispose();
    _addressTextController.dispose();
    _websiteTextController.dispose();
    _numberTextController.dispose();
    _pass2TextController.dispose();
    _emailTextController.dispose();
    _passTextController.dispose();
    _passFocusNode.dispose();
    _pass2FocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: mediaQuery.height * 0.3,
                width: mediaQuery.height * 0.3,
                child: Image.asset('assets/images/logo.png'),
              ),
              TextWidget(
                text: 'Create Account',
                textSize: 30,
              ),
              const VerticalSpacing(10),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        ///Company Name
                        textfill(_companyNameTextController, "Company Name",
                            'Company Name'),

                        ///name
                        textfill(
                            _yourNameTextController, "Your Name", 'Your Name'),

                        ///address
                        textfill(_addressTextController, "Enter Address",
                            'Enter Address'),

                        ///url link
                        textfill(_websiteTextController, "Website Link",
                            'Website Link'),

                        ///Contact Number
                        textfill(_numberTextController, "Contact Number",
                            'Contact Number'),

                        ///email
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_passFocusNode),
                          controller: _emailTextController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'Please enter a valid email address';
                            } else {
                              return null;
                            }
                          },
                          style: const TextStyle(color: primaryColor),
                          decoration: InputDecoration(
                            fillColor: primaryColor,
                            labelText: 'Email',
                            labelStyle: TextStyle(color: primaryColor),
                            border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: primaryColor),
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Email',
                            hintStyle: const TextStyle(
                                color: Color.fromARGB(255, 115, 114, 114)),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
//password

                        TextFormField(
                          textInputAction: TextInputAction.done,
                          onEditingComplete: () {
                            //   _submitFormOnLogin();
                          },
                          controller: _passTextController,
                          focusNode: _passFocusNode,
                          obscureText: _obscureText,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 7) {
                              return 'Please enter a valid password';
                            } else {
                              return null;
                            }
                          },
                          style: TextStyle(color: primaryColor),
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: primaryColor),
                                borderRadius: BorderRadius.circular(10)),
                            labelStyle: TextStyle(color: primaryColor),
                            focusColor: primaryColor,
                            suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: primaryColor,
                                )),
                            hintText: 'Password',
                            hintStyle: TextStyle(color: greyColor),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                          ),
                        ),
                        VerticalSpacing(20),

                        ///Confirm password
                        ///
                        TextFormField(
                          textInputAction: TextInputAction.done,
                          onEditingComplete: () {
                            //   _submitFormOnLogin();
                          },
                          controller: _pass2TextController,
                          focusNode: _pass2FocusNode,
                          obscureText: _obscureText,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 7) {
                              return 'Please enter a valid password';
                            } else {
                              return null;
                            }
                          },
                          style: TextStyle(color: primaryColor),
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            labelStyle: TextStyle(color: primaryColor),
                            border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: primaryColor),
                                borderRadius: BorderRadius.circular(10)),
                            focusColor: primaryColor,
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: primaryColor,
                                )),
                            hintText: 'Confirm Password',
                            hintStyle: TextStyle(color: greyColor),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
              const VerticalSpacing(10),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: CustomButton(
                  fct: () {
                    setState(() {
                      if (_formKey.currentState!.validate()) {
                        //check if form data are valid,
                        // your process task ahed if all data are valid
                      }
                    });
                  },
                  text: 'Registration',
                  color: primaryColor,
                ),
              ),
              const VerticalSpacing(10),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textPoppins(
                        text: 'You Have An Account.',
                        color: blackColor,
                        isTile: false,
                        fontSize: 14),
                    TextButton(
                      onPressed: () {
                        Get.to(LoginScreen());
                      },
                      child: textPoppins(
                          text: 'Login Account?',
                          color: primaryColor,
                          isTile: false,
                          fontSize: 13),
                    )
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {
                    Get.to(ForgetScreen());
                  },
                  child: Text('Forget Account?'))
            ],
          ),
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
            //eye icon

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
        const VerticalSpacing(20),
      ],
    );
  }
}


    //  validator: (value) {
    //                         if (value!.isEmpty || value.length < 7) {
    //                           return 'Please enter a valid password';
    //                         } else {
    //                           return null;
    //                         }
    //                       },

    //  validator: (value) {
    //                         if (value!.isEmpty || !value.contains('@')) {
    //                           return 'Please enter a valid email address';
    //                         } else {
    //                           return null;
    //                         }
    //                       },