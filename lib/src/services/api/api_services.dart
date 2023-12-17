import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:st_courier_bd/src/model/coverage_areaModel.dart';
import 'package:st_courier_bd/src/model/product.dart';
import 'package:st_courier_bd/src/model/user.dart';
import 'package:st_courier_bd/src/services/api/constant.dart';
import 'package:dio/dio.dart';

class ApiService {
  //api

  Future<AreaModel>? getArea() async {
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

// fetch('https://dummyjson.com/products/1')
// .then(res => res.json())
// .then(json => console.log(json))
}

class ApiClient {
  final Dio _dio = Dio();

  Future<Response> registerUser(Map<String, dynamic>? userData) async {
    try {
      Response response = await _dio.post(
          'https://api.loginradius.com/identity/v2/auth/register', //ENDPONT URL
          data: userData, //REQUEST BODY
          queryParameters: {'apikey': 'YOUR_API_KEY'}, //QUERY PARAMETERS
          options: Options(headers: {
            'X-LoginRadius-Sott': 'YOUR_SOTT_KEY', //HEADERS
          }));
      //returns the successful json object
      return response.data;
    } on DioError catch (e) {
      //returns the error object if there is
      return e.response!.data;
    }
  }

  Future<Response> login(String email, String password) async {
    try {
      Response response = await _dio.post(
        'https://api.loginradius.com/identity/v2/auth/login',
        data: {'email': email, 'password': password},
        queryParameters: {'apikey': 'YOUR_API_KEY'},
      );
      //returns the successful user data json object
      return response.data;
    } on DioError catch (e) {
      //returns the error object if any
      return e.response!.data;
    }
  }

  Future<Response> getUserProfileData(String accesstoken) async {
    try {
      Response response = await _dio.get(
        'https://api.loginradius.com/identity/v2/auth/account',
        queryParameters: {'apikey': 'YOUR_API_KEY'},
        options: Options(
          headers: {
           // 'Authorization': 'Bearer ${YOUR_ACCESS_TOKEN}',
          },
        ),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<Response> logout(String accessToken) async {
    try {
      Response response = await _dio.get(
        'https://api.loginradius.com/identity/v2/auth/access_token/InValidate',
       // queryParameters: {'apikey': ApiSecret.apiKey},
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
}

/////all
// Future<Album> createAlbum(String title) async {
//   final response = await http.post(
//     Uri.parse('https://jsonplaceholder.typicode.com/albums'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'title': title,
//     }),
//   );

//   if (response.statusCode == 201) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     throw Exception('Failed to create album.');
//   }
// }