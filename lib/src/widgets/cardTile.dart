// ignore_for_file: prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:st_courier_bd/src/component/colors/colors.dart';
import 'package:st_courier_bd/src/component/font/font_style.dart';
import 'package:st_courier_bd/src/widgets/vertical_spacing.dart';

class CardTile extends StatelessWidget {
  final String title;
  final String img;
  final Color iconBgColor;
  final String count;
  final String subText, parcent;

  Function onTap;

  CardTile(
      {Key? key,
      required this.title,
      required this.onTap,
      required this.img,
      required this.iconBgColor,
      required this.count,
      required this.subText,
      required this.parcent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    return Stack(
      clipBehavior: Clip.antiAlias,
      children: [
        Center(
          child: InkWell(
            onTap: () {
              onTap();
            },
            child: Material(
              shadowColor: const Color.fromARGB(255, 0, 0, 0),
              child: Container(
                height: _media.height * 0.14,
                width: _media.height * 0.20,
                child: Padding(
                  padding: const EdgeInsets.only(right: 7, top: 10, left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      textPoppins(
                          text: title,
                          color: blackColor,
                          isTile: false,
                          fontSize: 12),
                      textPoppins(
                          text: count,
                          color: blackColor,
                          isTile: true,
                          fontSize: 16),
                      const VerticalSpacing(4),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            subText.toString(),
                            style: const TextStyle(fontSize: 8),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.arrow_drop_up,
                                color: Colors.green,
                                size: 14,
                              ),
                              Text(
                                parcent.toString(),
                                style: TextStyle(fontSize: 8),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                //  height: _media.height * 0.11, width: _media.width * 0.41,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    const BoxShadow(
                      color: Color.fromARGB(154, 196, 194, 194),
                      offset: Offset(
                        1.0,
                        0.0,
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
              ),
            ),
          ),
        ),
        Positioned(
            top: 19,
            left: 25,
            child: CircleAvatar(
              backgroundColor: iconBgColor,
              radius: 23,
              child: Image.asset(
                img,
                height: 30,
                width: 30,
              ),
            )),
      ],
    );
  }
}
