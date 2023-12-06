import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:st_curier_bd/src/component/colors/colors.dart';
import 'package:st_curier_bd/src/widgets/custom_button.dart';
import 'package:st_curier_bd/src/widgets/main_drawar.dart';
import 'package:st_curier_bd/src/widgets/text_widget.dart';
import 'package:st_curier_bd/src/widgets/vertical_spacing.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<String> images = [
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png"
  ];
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextWidget(text: 'Dashboard', textSize: 24),
        toolbarHeight: 60,
      ),
      drawer: MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: CachedNetworkImageProvider(
                      'https://avatars.githubusercontent.com/u/79123931?v=4'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: ' Md. Habib',
                      textSize: 18,
                      isTitle: true,
                    ),
                    TextWidget(
                      text: ' Balance: 150\$',
                      textSize: 16,
                    ),
                    TextWidget(
                      text: ' 01568968493',
                      textSize: 17,
                    ),
                  ],
                ),
                CustomButton(
                    fct: () {}, text: 'VIEW PROFILE', color: primaryColor)
              ],
            ),
            const VerticalSpacing(20),
            Center(
              child: TextWidget(
                text: 'Welcome To ST Courier',
                textSize: 20,
                isTitle: true,
              ),
            ),

            const VerticalSpacing(20),
            CustomButton(fct: () {}, text: 'ADD PARCEL', color: primaryColor),
            const VerticalSpacing(20),

            SizedBox(
              height: 400,
              child: Container(
                  padding: const EdgeInsets.all(12.0),
                  child: GridView.builder(
                    itemCount: images.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 4.0,
                            mainAxisSpacing: 4.0),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          color: greyColor,
                          height: mediaQuery.height * 0.14,
                          width: mediaQuery.height * 0.11,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Image.network(
                                  images[index],
                                  height: mediaQuery.height * 0.1,
                                ),
                              ),
                              TextWidget(text: 'Total Parcel', textSize: 16),
                              const VerticalSpacing(10),
                              TextWidget(
                                text: '100',
                                textSize: 20,
                                isTitle: true,
                              ),
                              const VerticalSpacing(10),
                            ],
                          ));
                    },
                  )),
            ),

            ////////////////////
          ],
        ),
      ),
    );
  }

  Widget quantityControl(
      {required Function fct, required String text, required Color color}) {
    return Flexible(
      flex: 2,
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: color,
        child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              fct();
            },
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 18, right: 18, top: 8, bottom: 8),
              child: TextWidget(
                text: text,
                textSize: 16,
                color: whiteColor,
              ),
            )),
      ),
    );
  }
}
