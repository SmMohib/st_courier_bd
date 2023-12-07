import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:st_curier_bd/src/component/colors/colors.dart';
import 'package:st_curier_bd/src/services/auth/forget_password.dart';
import 'package:st_curier_bd/src/services/auth/loginScreen.dart';
import 'package:st_curier_bd/src/widgets/custom_button.dart';
import 'package:st_curier_bd/src/widgets/text_widget.dart';
import 'package:st_curier_bd/src/widgets/textfill_widget.dart';
import 'package:st_curier_bd/src/widgets/vertical_spacing.dart';
import 'package:get/get.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _emailTextController = TextEditingController();
  final _passTextController = TextEditingController();
  final _passFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  var _obscureText = true;
  @override
  void dispose() {
    _emailTextController.dispose();
    _passTextController.dispose();
    _passFocusNode.dispose();
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
                child: const Image(
                    image: CachedNetworkImageProvider(
                  'https://stcourier.stitbd.app/public/uploads/application/1692693950YRInjW3J1USkdT976599.jpg',
                )),
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
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_passFocusNode),
                          controller: _emailTextController,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(color: primaryColor),
                          decoration: InputDecoration(
                            fillColor: primaryColor,
                            labelText: 'Company Name',
                            labelStyle: TextStyle(color: primaryColor),
                            border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: primaryColor),
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Company Name',
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

                        ///name
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
                            labelText: 'Your Name',
                            labelStyle: TextStyle(color: primaryColor),
                            border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: primaryColor),
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Your Name',
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

                        ///address
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
                            labelText: 'Enter Address',
                            labelStyle: TextStyle(color: primaryColor),
                            border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: primaryColor),
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Enter Address',
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

                        ///url link
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
                            labelText: 'Website Url Link',
                            labelStyle: TextStyle(color: primaryColor),
                            border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: primaryColor),
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Website Url Link',
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

                        ///Contact Number
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
                            labelText: 'Contact Number',
                            labelStyle: TextStyle(color: primaryColor),
                            border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: primaryColor),
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Contact Number',
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
                    Text(
                      'You Have An Account.',
                      style: GoogleFonts.abel(),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(LoginScreen());
                        },
                        child: Text(
                          'Login Account?',
                          style: GoogleFonts.abel(),
                        ))
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
}
