import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:st_courier_bd/src/component/colors/colors.dart';
import 'package:st_courier_bd/src/component/font/font_style.dart';
import 'package:st_courier_bd/src/screens/home_screen.dart';
import 'package:st_courier_bd/src/services/api/constant.dart';
import 'package:st_courier_bd/src/services/auth/forget_password.dart';
import 'package:st_courier_bd/src/services/auth/registrationScreen.dart';
import 'package:st_courier_bd/src/custom_ui/custom_button.dart';
import 'package:st_courier_bd/src/widgets/text_widget.dart';
import 'package:st_courier_bd/src/widgets/vertical_spacing.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
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

  Future<void> loginWithEmail() async {
    var headers = {'Content-Type': 'application/json'};
    try {
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.loginEmail);
      Map body = {
        'email': _emailTextController.text.trim(),
        'password': _passTextController.text
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['code'] == 0) {
          var token = json['data']['Token'];
          final SharedPreferences? prefs = await _prefs;
          await prefs?.setString('token', token);

          _emailTextController.clear();
          _passTextController.clear();
          Get.off(HomeScreen());
        } else if (json['code'] == 1) {
          throw jsonDecode(response.body)['message'];
        }
      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
      }
    } catch (error) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(error.toString())],
            );
          });
    }
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
                text: 'Login',
                textSize: 30,
              ),
              const VerticalSpacing(10),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
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
                          decoration: const InputDecoration(
                            fillColor: primaryColor,
                            labelText: 'Email',
                            labelStyle: TextStyle(color: primaryColor),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            hintText: 'Email',
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 115, 114, 114)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

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
                            if (value!.isEmpty || value.length < 1) {
                              return 'Please enter a valid password';
                            } else {
                              return null;
                            }
                          },
                          style: const TextStyle(color: primaryColor),
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: const TextStyle(color: primaryColor),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
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
                      ],
                    )),
              ),
              const VerticalSpacing(10),
              //login
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: CustomButton(
                    fct: () {
                      setState(() {
                        if (_formKey.currentState!.validate()) {
                          loginWithEmail().whenComplete(() => Get.to(HomeScreen()));

              
                          // your process task ahed if all data are valid
                        }
                      });
                    },
                    text: 'LOGIN',
                    color: primaryColor),
              ),
              const VerticalSpacing(10),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textPoppins(
                        text: 'You Have No Account.',
                        color: blackColor,
                        isTile: false,
                        fontSize: 14),
                    TextButton(
                      onPressed: () {
                        Get.to(const RegistrationScreen());
                      },
                      child: textPoppins(
                          text: 'Create Account?',
                          color: primaryColor,
                          isTile: false,
                          fontSize: 13),
                    ),
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {
                    Get.to(const ForgetScreen());
                  },
                  child: const Text('Forget Account?'))
            ],
          ),
        ),
      ),
    );
  }
}
