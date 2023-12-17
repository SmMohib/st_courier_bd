import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:st_courier_bd/src/component/colors/colors.dart';
import 'package:st_courier_bd/src/component/font/font_style.dart';
import 'package:st_courier_bd/src/custom_ui/custom_button.dart';
import 'package:st_courier_bd/src/custom_ui/custom_container.dart';
import 'package:st_courier_bd/src/custom_ui/Deafult_button.dart';
import 'package:st_courier_bd/src/custom_ui/gradient_button.dart';
import 'package:st_courier_bd/src/model/coverage_areaModel.dart';

import '../../services/api/constant.dart';
import '../../widgets/vertical_spacing.dart';

class AddParcelScreen extends StatefulWidget {
  const AddParcelScreen({super.key});

  @override
  State<AddParcelScreen> createState() => _AddParcelScreenState();
}

class _AddParcelScreenState extends State<AddParcelScreen> {
  int _counter = 0;
  late final ValueChanged? onChanged;
  final List<List> numberStrings = [];

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  // Loading counter value on start
  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
    });
  }

  // Incrementing counter after click
  void _incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0) + 1;
      prefs.setInt('counter', _counter);
    });
  }
//sum data
  String calculateTotalCharge() {
    // Calculate the sum of charges dynamically
    int collectAmount = int.tryParse(_price2TextController.text) ?? 0;
    int weightCharge = 29;
    int deliveryCharge = 100;
    int codCharge = 19;

    int totalCharge = collectAmount + weightCharge + deliveryCharge + codCharge;

    return totalCharge.toString();
  }

  final _customerTextController = TextEditingController();
  final _companyTextController = TextEditingController();
  final _phoneTextController = TextEditingController();
  final _addressTextController = TextEditingController();
  final _districtTextController = TextEditingController();
  final _areaTextController = TextEditingController();
  final _orderidTextController = TextEditingController();
  final _collectionnoTextController = TextEditingController();
  final _ordernoTextController = TextEditingController();
  final _priceTextController = TextEditingController();
  final _price2TextController = TextEditingController();
  final _descriptionTextController = TextEditingController();
  final _remarkTextController = TextEditingController();
  final _textFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // ignore: unused_field
  final _obscureText = true;
  int itemCount = 0;
  int sum = 0;
  void updateItemCount(String text) {
    int enteredNumber = int.tryParse(text) ?? 0;
    _price2TextController.text = enteredNumber.toString();
    setState(() {});
  }

  @override
  void dispose() {
    _companyTextController.dispose();
    _customerTextController.dispose();
    _companyTextController.dispose();
    _phoneTextController.dispose();
    _addressTextController.dispose();
    _districtTextController.dispose();
    _areaTextController.dispose();
    _orderidTextController.dispose();
    _collectionnoTextController.dispose();
    _ordernoTextController.dispose();
    _priceTextController.dispose();
    _price2TextController.dispose();
    _descriptionTextController.dispose();
    _remarkTextController.dispose();

    _textFocusNode.dispose();
    super.dispose();
  }
  ///api
    Future<AreaModel> createAlbum(String title) async {
    final response = await http.post(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.ADD_PARCEL_URI),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
      }),
    );

    if (response.statusCode == 201) {
      return AreaModel.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to create album.');
    }
  }
//end
  @override
  Widget build(BuildContext context) {
    String concatenatedString = numberStrings.join('');
    int sum = int.tryParse(concatenatedString) ?? 0;
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

            textfill(_customerTextController, (value) {}, 'Customer Name',
                'Customer Name'),
            textfill(_phoneTextController, (value) {}, 'Phone Number',
                'Phone Number'),
            textfill(_addressTextController, (value) {}, 'Customer Address',
                'Customer Address'),
            textfill(
                _districtTextController, (value) {}, 'District', 'District'),
            textfill(_areaTextController, (value) {}, 'Customer Area',
                'Customer Area'),
            const VerticalSpacing(10),
            CustomContainer(text: 'Parcel Information', color: primaryColor),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: textfill(_orderidTextController, (value) {},
                        'Merchant Order No', 'Merchant Order No'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    flex: 2,
                    child: textfill(_collectionnoTextController, (value) {},
                        'Collection No', 'Collection No'),
                  )
                ],
              ),
            ),

            const VerticalSpacing(10),
            textfill(
                _ordernoTextController, (value) {}, ' Order No', 'Order No'),
            textfill(_priceTextController, (text) {
              updateItemCount(text);
            }, 'Product Value (Price)', 'Product Value (Price)'),
            textfill(_descriptionTextController, (value) {},
                'Enter Product Description', 'Enter Product Description'),
            textfill(_remarkTextController, (value) {}, 'Remarks', 'Remarks'),
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
                      rowTextCharge(
                        text1: 'Collect Amount',
                        text2: '${_price2TextController.text}',
                      ),
                      rowTextCharge(text1: 'Weight Charge', text2: '10'),
                      rowTextCharge(text1: 'Delivery Charge', text2: '120'),
                      rowTextCharge(text1: 'COD Charge', text2: '4'),
                      rowTextCharge(
                        text1: 'Total Charge',
                        text2: calculateTotalCharge(),
                      ),
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
  textfill(TextEditingController controller, ValueChanged? onChanged,
      String label, String hint) {
    return Padding(
      padding: EdgeInsets.only(left: 5, right: 5, top: 5),
      child: Column(
        children: [
          TextFormField(
            controller: controller,
            textInputAction: TextInputAction.next,
            onEditingComplete: () =>
                FocusScope.of(context).requestFocus(_textFocusNode),
            // controller: _emailTextController,

            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onChanged: onChanged,

            textAlign: TextAlign.center,
            style: TextStyle(color: primaryColor),
            decoration: InputDecoration(
              fillColor: primaryColor,
              labelText: label,

              labelStyle: TextStyle(color: primaryColor, fontSize: 16),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
              ),
              //counterText: 'Text',
              hintMaxLines: 5,
              hintText: hint,
              hintStyle: TextStyle(
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
                  text: ':\৳${text2}.00',
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
