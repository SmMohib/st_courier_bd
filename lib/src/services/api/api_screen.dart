// ignore_for_file: must_be_immutable

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:st_courier_bd/src/model/coverage_areaModel.dart';
import 'package:st_courier_bd/src/model/product.dart';

import '../../model/album.dart';

class ApiTest extends StatefulWidget {
  const ApiTest({super.key});

  @override
  State<ApiTest> createState() => _ApiTestState();
}

class _ApiTestState extends State<ApiTest> {
  Future<Album> createAlbum(String title) async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
      }),
    );

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }

  Future<ShopModel> fetchAlbum() async {
    final response = await http.get(
      Uri.parse('https://dummyjson.com/products'),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return ShopModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<Album> updateAlbum(String title) async {
    final response = await http.put(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to update album.');
    }
  }

  ShopModel? dataFromAPI;
  final TextEditingController _texteditController = TextEditingController();
  final TextEditingController _controller = TextEditingController();
  late Future<ShopModel> _futureAlbum;

  @override
  void initState() {
    super.initState();
    _futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Data Example'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                child: FutureBuilder<ShopModel>(
                  future: _futureAlbum,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                TextField(
                                  controller: _texteditController,
                                  decoration: const InputDecoration(
                                      hintText: 'Enter Title'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      // _futureAlbum =
                                      //     createAlbum(_texteditController.text);
                                    });
                                  },
                                  child: const Text('Create Data'),
                                ),
                              ],
                            ),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                    }

                    return const CircularProgressIndicator();
                  },
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                child: FutureBuilder<ShopModel>(
                  future: _futureAlbum,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  TextField(
                                    controller: _controller,
                                    decoration: const InputDecoration(
                                      hintText: 'Enter Title',
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        // _futureAlbum =
                                        //     updateAlbum(_controller.text);
                                      });
                                    },
                                    child: const Text('Update Data'),
                                  ),
                                ],
                              )
                            ]);
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                    }

                    return const CircularProgressIndicator();
                  },
                ),
              ),
            ),
            SizedBox(
              height: 500,
              child: Center(
                child: FutureBuilder<ShopModel>(
                  future: _futureAlbum,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.products!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              onTap: () {
                                // Get.defaultDialog(
                                //     title: ' Edit Text',
                                //     onCancel: () {},
                                //     onConfirm: () {
                                //       setState(() {

                                //         // _futureAlbum =
                                //         //     updateAlbum(_controller.text);
                                //       });
                                //     },
                                //     content: Column(
                                //       mainAxisSize: MainAxisSize.min,
                                //       children: [
                                //         TextField(
                                //           controller: _controller,
                                //           keyboardType: TextInputType.text,
                                //           maxLines: 1,
                                //           decoration: const InputDecoration(
                                //               labelText: 'Category Name',
                                //               hintMaxLines: 1,
                                //               border: OutlineInputBorder(
                                //                   borderSide: BorderSide(
                                //                       color: Colors.green,
                                //                       width: 4.0))),
                                //         ),
                                //         const SizedBox(
                                //           height: 30.0,
                                //         ),
                                //         ElevatedButton(
                                //           onPressed: () {
                                //             setState(() {
                                //               // _futureAlbum = updateAlbum(
                                //               //     _controller.text);
                                //             });
                                //           },
                                //           child: const Text(
                                //             'ADD CATEGORY',
                                //             style: TextStyle(
                                //                 color: Colors.white,
                                //                 fontSize: 16.0),
                                //           ),
                                //         )
                                //       ],
                                //     ),
                                //     radius: 10.0);
                              },
                              leading: Image.network(
                                snapshot.data!.products![index].thumbnail
                                    .toString(),
                                width: 100,
                              ),
                              title: Text(snapshot
                                  .data!.products![index].description
                                  .toString()),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }

                    // By default, show a loading spinner.
                    return const CircularProgressIndicator();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/////////
class Details extends StatefulWidget {
  Details({super.key, required this.dataModelFromAPI});
  String? title;
  ShopModel dataModelFromAPI;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.dataModelFromAPI}'),
      ),
    );
  }
}

//model



