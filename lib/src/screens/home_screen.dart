import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:st_curier_bd/src/component/colors/colors.dart';
import 'package:st_curier_bd/src/widgets/custom_button.dart';
import 'package:st_curier_bd/src/widgets/main_drawar.dart';
import 'package:st_curier_bd/src/widgets/text_widget.dart';
import 'package:st_curier_bd/src/widgets/vertical_spacing.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Model? model;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: TextWidget(text: 'Dashboard', textSize: 24),
          toolbarHeight: 60,
        ),
        drawer: MainDrawer(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                //profile
                Column(
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
                            Text(
                              'Hanif',
                              style: GoogleFonts.roboto(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            TextWidget(
                              text: 'Balance: \৳150',
                              textSize: 16,
                            ),
                            TextWidget(
                              text: '0156896843',
                              textSize: 17,
                            ),
                          ],
                        ),
                        CustomButton(
                            fct: () {},
                            text: 'VIEW PROFILE',
                            color: primaryColor)
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
                    const VerticalSpacing(10),
                    CustomButton(
                        fct: () {}, text: 'ADD PARCEL', color: primaryColor),
                    const VerticalSpacing(20),
                  ],
                ),
                //services
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        serviceButton(
                            ontap: () {},
                            img:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdm3pVBm5kr6Fdqen_7uZD5duuK_8KHAqQfg&usqp=CAU',
                            title: '  Total \n Parcel',
                            amount: '35'),
                        serviceButton(
                            ontap: () {},
                            img:
                                'https://static.vecteezy.com/system/resources/previews/013/661/246/non_2x/cancellation-wrong-delivery-glyph-pictogram-cancel-parcel-box-order-icon-reject-purchase-in-cardboard-box-delete-package-silhouette-black-icon-remove-product-pack-isolated-illustration-vector.jpg',
                            title: ' Cancel \n Parcel',
                            amount: '3'),
                        serviceButton(
                            ontap: () {},
                            img:
                                'https://w7.pngwing.com/pngs/645/268/png-transparent-logistics-computer-icons-transport-logistic-warehouse-miscellaneous-angle-cargo-thumbnail.png',
                            title: 'Pending in\n   Pickup',
                            amount: '34'),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        serviceButton(
                            ontap: () {},
                            img:
                                'https://static.thenounproject.com/png/1933935-200.png',
                            title: ' Panding \n Delivery',
                            amount: '35'),
                        serviceButton(
                            ontap: () {},
                            img:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4snHfD6APcwZw2icZXFP07jHn9nQTX0cYE83YUOlUtfTQ01urKT1il1eRJ4KwsBL0E4Q&usqp=CAU',
                            title: '  Delivery \n Complete',
                            amount: '34'),
                        serviceButton(
                            ontap: () {},
                            img:
                                'https://w7.pngwing.com/pngs/74/916/png-transparent-computer-icons-money-payment-coin-coin-payment-logo-bank-thumbnail.png',
                            title: ' Payment \nComplete',
                            amount: '44'),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        serviceButton(
                            ontap: () {},
                            img:
                                'https://w7.pngwing.com/pngs/652/411/png-transparent-product-return-policy-money-back-guarantee-computer-icons-return-angle-retail-rectangle-thumbnail.png',
                            title: '  Return \n  Parcel',
                            amount: '5'),
                        serviceButton(
                            ontap: () {},
                            img:
                                'https://w7.pngwing.com/pngs/869/958/png-transparent-iphone-6-computer-icons-completion-angle-text-triangle-thumbnail.png',
                            title: '  Return \nComplete',
                            amount: '45'),
                        serviceButton(
                            ontap: () {},
                            img:
                                'https://w7.pngwing.com/pngs/673/188/png-transparent-recycling-symbol-logo-waste-others-miscellaneous-angle-text-thumbnail.png',
                            title: ' Return In\n Progress',
                            amount: '35'),
                      ],
                    )
                  ],
                ),
                const VerticalSpacing(10),
                //total amount
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    totalButton(
                        img:
                            'https://w7.pngwing.com/pngs/933/104/png-transparent-payment-computer-icons-money-credit-card-indian-rupee-sign-web-production-angle-text-hand-thumbnail.png',
                        title: 'Total Collect Amount',
                        amount: '12,990'),
                    totalButton(
                        img:
                            'https://w7.pngwing.com/pngs/418/178/png-transparent-payment-gateway-credit-card-computer-icons-point-of-sale-automotive-industry-business-card-angle-text-service-thumbnail.png',
                        title: 'Total Paid Amount',
                        amount: '120,990'),
                  ],
                ),
              ],
            ),
          ),
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

//servicebutton
  Widget serviceButton(
      {required String img,
      required String title,
      required String amount,
      required Function ontap}) {
    return InkWell(
      onTap: () {
        ontap();
      },
      child: Card(
        child: Container(
          height: 130,
          width: 102,
          decoration: BoxDecoration(
              color: whiteColor, borderRadius: BorderRadius.circular(14)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                  child: Image(
                      image: CachedNetworkImageProvider(
                    img,
                    maxHeight: 40,
                    maxWidth: 40,
                  )),
                ),
                const VerticalSpacing(6),
                SizedBox(
                  height: 45,
                  child: Text(
                    title!.toString(),
                    style: GoogleFonts.robotoCondensed(
                      fontSize: 17,
                    ),
                  ),
                ),
                SizedBox(
                  height: 26,
                  child: Text(
                    amount!.toString(),
                    style: GoogleFonts.robotoCondensed(
                        fontSize: 24, fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//total Button
  Widget totalButton(
      {required String img, required String title, required String amount}) {
    return InkWell(
      onTap: () {},
      child: Card(
        child: Container(
          decoration: BoxDecoration(
              color: whiteColor, borderRadius: BorderRadius.circular(14)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Image(
                    image: CachedNetworkImageProvider(
                  img,
                  maxHeight: 50,
                  maxWidth: 50,
                )),
              ),
              const VerticalSpacing(6),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Text(
                  title!.toString(),
                  style: GoogleFonts.barlow(
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  amount!.toString(),
                  style: GoogleFonts.robotoCondensed(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
