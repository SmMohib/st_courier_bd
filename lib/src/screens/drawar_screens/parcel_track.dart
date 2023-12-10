import 'package:flutter/material.dart';
import 'package:st_courier_bd/src/custom_ui/custom_button.dart';

import '../../component/colors/colors.dart';
import '../../component/font/font_style.dart';
import '../../widgets/vertical_spacing.dart';

class ParcelTrackScreen extends StatefulWidget {
  const ParcelTrackScreen({super.key});

  @override
  State<ParcelTrackScreen> createState() => _ParcelTrackScreenState();
}

class _ParcelTrackScreenState extends State<ParcelTrackScreen> {
  final _companyTextController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  // ignore: unused_field
  final _obscureText = true;

  @override
  void dispose() {
    _companyTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: textRoboro(
            text: 'Parcel Track',
            color: whiteColor,
            isTile: false,
            fontSize: 20),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            textfill(_companyTextController, 'Invoice No', 'Invoice No'),
            VerticalSpacing(20),
            CustomButton(fct: () {}, text: 'ENTER', color: primaryColor)
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
}
