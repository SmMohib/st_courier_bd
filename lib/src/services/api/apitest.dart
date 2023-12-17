// import 'package:flutter/material.dart';
// import 'package:st_courier_bd/src/model/product.dart';
// import 'package:st_courier_bd/src/model/services_model.dart';
// import 'package:st_courier_bd/src/services/api/api_services.dart';
// import 'package:st_courier_bd/src/widgets/load.dart';

// import '../../model/user.dart';

// class ApiHome extends StatefulWidget {
//   const ApiHome({Key? key}) : super(key: key);

//   @override
//   _ApiHomeState createState() => _ApiHomeState();
// }

// class _ApiHomeState extends State<ApiHome> {
//   late List<ShopModel>? _userModel = [];
//   @override
//   void initState() {
//     super.initState();
//     _getData();
//   }

//   void _getData() async {
//    // _userModel = (await ApiService().getproduct());
//     Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('REST API Example'),
//       ),
//       body: _userModel == null || _userModel!.isEmpty
//           ? Loader()
//           : ListView.builder(
//               itemCount: _userModel!.length,
//               itemBuilder: (context, index) {
//                 return Card(
//                   child: ListTile(
//                     leading: Text(_userModel![index].id.toString()),
//                     title: Text(_userModel![index].rating.toString()),
//                     subtitle: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                             'User Name: ${_userModel![index].price.toString()}'),
//                       ],
//                     ),

//                     //  trailing: ,
//                   ),
//                 );
//                 // return Card(
//                 //   child: Column(
//                 //     children: [
//                 //       Text(_userModel![index].id.toString()),
//                 //       Text(_userModel![index].username.toString()),
//                 //       const SizedBox(
//                 //         height: 20.0,
//                 //       ),
//                 //       Text(_userModel![index].email.toString()),
//                 //       Text(_userModel![index].website.toString()),
//                 //     ],
//                 //   ),
//                 // );
//               },
//             ),
//     );
//   }
// }
