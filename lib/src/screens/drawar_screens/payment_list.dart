import 'package:flutter/material.dart';
import 'package:st_courier_bd/src/component/colors/colors.dart';
import 'package:st_courier_bd/src/component/font/font_style.dart';

import '../../widgets/vertical_spacing.dart';

class PaymentListScreen extends StatefulWidget {
  const PaymentListScreen({super.key});

  @override
  State<PaymentListScreen> createState() => _PaymentListScreenState();
}

class _PaymentListScreenState extends State<PaymentListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: textRoboro(
            text: 'Payment List',
            color: whiteColor,
            isTile: false,
            fontSize: 20),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 10,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                ),
                child: Card(
                  color: whiteColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            textRoboro(
                                text: 'MPAY -123212',
                                color: redColor,
                                isTile: false,
                                fontSize: 16),
                            const VerticalSpacing(5),
                            textPoppins(
                                text: 'Delivery \nPayment accept',
                                color: blackColor,
                                isTile: false,
                                fontSize: 16),
                          ],
                        ),
                        const VerticalSpacing(25),
                        rowText(text1: 'Parcel: 1', text2: 'Rcv Parcel: 3'),
                        rowText(
                            text1: 'Amount: 1,000', text2: 'Rcv Amount: 3,000'),
                        const VerticalSpacing(5),
                        textPoppins(
                            text: 'Date: 2023-12-7  1:30:34 PM',
                            color: blackColor,
                            isTile: false,
                            fontSize: 13),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

//rowText
  rowText({required String text1, required String text2}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 4,
              child: textPoppins(
                  text: text1, color: blackColor, isTile: false, fontSize: 13),
            ),
            Expanded(
              flex: 4,
              child: textPoppins(
                  text: ('${text2}'),
                  color: blackColor,
                  isTile: false,
                  fontSize: 13),
            ),
          ],
        ),
      ],
    );
  }
}
