import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:st_courier_bd/src/component/colors/colors.dart';
import 'package:st_courier_bd/src/screens/home_screen.dart';
import 'package:st_courier_bd/src/services/auth/forget_password.dart';
import 'package:st_courier_bd/src/services/auth/registrationScreen.dart';
import 'package:st_courier_bd/src/custom_ui/custom_button.dart';
import 'package:st_courier_bd/src/widgets/text_widget.dart';
import 'package:st_courier_bd/src/widgets/textfill_widget.dart';
import 'package:st_courier_bd/src/widgets/vertical_spacing.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _oldpassTextController = TextEditingController();
  final _newpassTextController = TextEditingController();
  final _currentpassTextController = TextEditingController();
  final _passFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  var _obscureText = true;
  @override
  void dispose() {
    _oldpassTextController.dispose();
    _newpassTextController.dispose();
    _currentpassTextController.dispose();
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
                child: Image.asset('assets/images/logo.png'),
              ),
              TextWidget(
                text: 'Change Password',
                textSize: 30,
              ),
              const VerticalSpacing(10),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
//Old password
                        passwordFill(
                            lebel: 'Old password',
                            hint: 'Old password',
                            controller: _oldpassTextController),
//new password
                        passwordFill(
                            lebel: 'New Password',
                            hint: 'New Password',
                            controller: _newpassTextController),
//current password
                        passwordFill(
                            lebel: 'Current Password',
                            hint: 'Current Password',
                            controller: _currentpassTextController),
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
                          //check if form data are valid,
                          Get.to(HomeScreen());
                          // your process task ahed if all data are valid
                        }
                      });
                    },
                    text: 'UPDATE PASSWORD',
                    color: primaryColor),
              ),
              const VerticalSpacing(10),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'You Have No Account.',
                      style: GoogleFonts.abel(),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(RegistrationScreen());
                        },
                        child: Text(
                          'Create Account?',
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

  passwordFill(
      {required String lebel,
      required String hint,
      required TextEditingController controller}) {
    return Column(
      children: [
        TextFormField(
          textInputAction: TextInputAction.done,
          onEditingComplete: () {
            //   _submitFormOnLogin();
          },
          controller: controller,
          focusNode: _passFocusNode,
          obscureText: _obscureText,
          keyboardType: TextInputType.visiblePassword,
          validator: (value) {
            if (value!.isEmpty || value.length < 6) {
              return 'Please enter a valid password';
            } else {
              return null;
            }
          },
          style: TextStyle(color: primaryColor),
          decoration: InputDecoration(
            labelText: 'Old Password',
            labelStyle: TextStyle(color: primaryColor),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: primaryColor),
            ),
            focusColor: primaryColor,
            suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: primaryColor,
                )),
            hintText: 'Old Password',
            hintStyle: TextStyle(color: greyColor),
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
      ],
    );
  }
}
