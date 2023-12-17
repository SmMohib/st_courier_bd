import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:st_courier_bd/src/model/coverage_areaModel.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  //'https://fakestoreapi.com/products'

  // Future<void> fetchProducts() async {
  // you can replace your api link with this link
  //https://stcourier.softwaresale.xyz/api/getServiceAreas
  //https://fakestoreapi.com/products

  Future<AreaModel>? getProductsApi() async {
    AreaModel == <CoverageAreas>[];
    //create your own api
    final response = await http.get(
        Uri.parse('https://stcourier.softwaresale.xyz/api/getServiceAreas'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return AreaModel.fromJson(data);
    } else {
      return AreaModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Api Course'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<AreaModel>(
                future: getProductsApi(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.coverageAreas!.length,
                        itemBuilder: (context, index) {
                          return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  title: Text(
                                      snapshot.data!.coverageAreas![index].coverageArea.toString()),
                                ),
                              ]);
                        });
                  } else {
                    return Text('Loading');
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
