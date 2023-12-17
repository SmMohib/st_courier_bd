import 'package:flutter/material.dart';
import 'package:st_courier_bd/src/component/colors/colors.dart';
import 'package:st_courier_bd/src/component/font/font_style.dart';
import 'package:st_courier_bd/src/model/coverage_areaModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../services/api/constant.dart';
import '../../widgets/load.dart';

class CoverageAreaScreen extends StatefulWidget {
  const CoverageAreaScreen({super.key});

  @override
  State<CoverageAreaScreen> createState() => _CoverageAreaScreenState();
}

class _CoverageAreaScreenState extends State<CoverageAreaScreen> {
  //api get data
  Future<AreaModel>? getAreaApi() async {
    //create your own api
    final response = await http
        .get(Uri.parse(ApiConstants.baseUrl + ApiConstants.COVERAGE_AREA_URI));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return AreaModel.fromJson(data);
    } else {
      return AreaModel.fromJson(data);
    }
  }

  //end
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: textRoboro(
            text: 'Coverage Area',
            color: whiteColor,
            isTile: false,
            fontSize: 20),
      ),
      body: FutureBuilder<AreaModel>(
        future: getAreaApi(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.coverageAreas!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        border: Border.all(
                          color: primaryColor,
                          width: 0.12,
                        ), //Border.all
                        borderRadius: BorderRadius.circular(15),
                        // ignore: prefer_const_literals_to_create_immutables
                        boxShadow: [
                          const BoxShadow(
                            color: blackColor,
                            offset: Offset(
                              0.0,
                              0.0,
                            ), //Offset
                            blurRadius: 0.1,
                            spreadRadius: 0.1,
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
                        padding: EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          //Text( _areaModel![index].coverageArea),
                          children: [
                            textPoppins(
                                text: snapshot
                                    .data!.coverageAreas![index].coverageArea
                                    .toString(),
                                color: primaryColor,
                                isTile: false,
                                fontSize: 20),
                            rowText(
                                text1: 'Area',
                                text2: snapshot
                                    .data!.coverageAreas![index].coverageArea
                                    .toString()),
                            rowText(
                                text1: 'District',
                                text2: snapshot
                                    .data!.coverageAreas![index].districtName
                                    .toString()),
                            rowText(
                                text1: 'Zip',
                                text2: snapshot
                                    .data!.coverageAreas![index].postCode
                                    .toString()),
                            rowText(
                                text1: 'Service',
                                text2: snapshot
                                    .data!.coverageAreas![index].serviceAreaName
                                    .toString()),
                            rowText(
                                text1: 'COD',
                                text2: snapshot
                                    .data!.coverageAreas![index].codCharge
                                    .toString()),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return Loader();
          }
        },
      ),

      //
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
              flex: 3,
              child: textPoppins(
                  text: text1, color: blackColor, isTile: false, fontSize: 13),
            ),
            Expanded(
              flex: 4,
              child: textPoppins(
                  text: (': ${text2}'),
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
