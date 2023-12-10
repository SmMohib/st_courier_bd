// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:st_courier_bd/src/model/services_model.dart';

// import '../component/colors/colors.dart';
// import 'vertical_spacing.dart';

// class CustomGridView extends StatefulWidget {
//   CustomGridView({super.key});


//   @override
//   State<CustomGridView> createState() => _CustomGridViewState();
// }

// class _CustomGridViewState extends State<CustomGridView> {
//   List<String>? images = [
//     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdm3pVBm5kr6Fdqen_7uZD5duuK_8KHAqQfg&usqp=CAU",
//     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdm3pVBm5kr6Fdqen_7uZD5duuK_8KHAqQfg&usqp=CAU",
//     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdm3pVBm5kr6Fdqen_7uZD5duuK_8KHAqQfg&usqp=CAU",
//     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdm3pVBm5kr6Fdqen_7uZD5duuK_8KHAqQfg&usqp=CAU",
//     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdm3pVBm5kr6Fdqen_7uZD5duuK_8KHAqQfg&usqp=CAU",
//     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdm3pVBm5kr6Fdqen_7uZD5duuK_8KHAqQfg&usqp=CAU",
//     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdm3pVBm5kr6Fdqen_7uZD5duuK_8KHAqQfg&usqp=CAU",
//     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdm3pVBm5kr6Fdqen_7uZD5duuK_8KHAqQfg&usqp=CAU",
//     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdm3pVBm5kr6Fdqen_7uZD5duuK_8KHAqQfg&usqp=CAU",
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context).size;
//     return GridView.builder(
//       itemCount:10 ,
//       shrinkWrap: true,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 3, crossAxisSpacing: 5.0, mainAxisSpacing: 5.0),
//       itemBuilder: (BuildContext context, int index) {
//         return Card(
//           shadowColor: greyColor,
//           child: Container(
//             color: whiteColor,
//             child: Column(
//               children: [
//                 Image.network(
//                   images![index],
//                   height: 50,
//                   width: 50,
//                 ),
//                 VerticalSpacing(6),
//                 const Text(
//                   "Total Parcel",
//                   style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//                 ),
//                 const Text(
//                   "140",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//     // return GridView.builder(
//     //             itemCount: images!.length,
//     //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//     //                 crossAxisCount: 3,
//     //                 crossAxisSpacing: 5.0,
//     //                 mainAxisSpacing: 5.0),
//     //             itemBuilder: (BuildContext context, int index) {
//     //               // return Image.network(images[index]);
//     //               return Container(
//     //                 height: mediaQuery.height * 3.1,
//     //                 //  width: mediaQuery.height * 0.33,
//     //                 padding: const EdgeInsets.all(5),
//     //                 // margin: const EdgeInsets.all(20),
//     //                 decoration: const BoxDecoration(
//     //                   //border: Border.all(color: Colors.black, width: 4),
//     //                   // borderRadius: BorderRadius.circular(8),
//     //                   boxShadow: [
//     //                     BoxShadow(
//     //                       color: Color.fromARGB(255, 206, 206, 206),
//     //                       offset: Offset(6.0, 6.0),
//     //                     ),
//     //                   ],
//     //                 ),
//     //                 child: Column(
//     //                   children: [
//     //                     const VerticalSpacing(10),
//     //                     Padding(
//     //                       padding: const EdgeInsets.all(3.0),
//     //                       child: Center(
//     //                         child: Image.network(
//     //                           // images[index],
//     //                           images!.first,
//     //                           height: mediaQuery.height * 00.1,
//     //                         ),
//     //                       ),
//     //                     ),
//     //                     const VerticalSpacing(10),
//     //                     const Text(
//     //                       "Total Parcel",
//     //                       style: TextStyle(
//     //                           fontSize: 16, fontWeight: FontWeight.bold),
//     //                     ),
//     //                     const VerticalSpacing(14),
//     //                     const Text(
//     //                       "140",
//     //                       style: TextStyle(
//     //                           fontSize: 22, fontWeight: FontWeight.w700),
//     //                     ),
//     //                   ],
//     //                 ),
//     //               );
//     //             },
//     //           );
//     // return GridView.count(
//     //   shrinkWrap: true,
//     //   physics: const NeverScrollableScrollPhysics(),
//     //   crossAxisCount: 3,

//     //   padding: EdgeInsets.zero,
//     //   // crossAxisSpacing: 10,
//     //   childAspectRatio: mediaQuery.height * 0.61,
//     //   //  childAspectRatio: size.width / (size.height * 0.61),
//     //   children: [

//     //     Container(
//     //       height: mediaQuery.height * 3.1,
//     //       //  width: mediaQuery.height * 0.33,
//     //       padding: const EdgeInsets.all(5),
//     //       // margin: const EdgeInsets.all(20),
//     //       decoration: const BoxDecoration(
//     //         //border: Border.all(color: Colors.black, width: 4),
//     //         // borderRadius: BorderRadius.circular(8),
//     //         boxShadow: [
//     //           BoxShadow(
//     //             color: Color.fromARGB(255, 206, 206, 206),
//     //             offset: Offset(6.0, 6.0),
//     //           ),
//     //         ],
//     //       ),
//     //       child: Column(
//     //         children: [
//     //           const VerticalSpacing(10),
//     //           Padding(
//     //             padding: const EdgeInsets.all(3.0),
//     //             child: Center(
//     //               child: Image.network(
//     //                 // images[index],
//     //                 images!.first,
//     //                 height: mediaQuery.height * 00.1,
//     //               ),
//     //             ),
//     //           ),
//     //           const VerticalSpacing(10),
//     //           const Text(
//     //             "Total Parcel",
//     //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//     //           ),
//     //           const VerticalSpacing(14),
//     //           const Text(
//     //             "140",
//     //             style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
//     //           ),
//     //         ],
//     //       ),
//     //     ),
//     //  ],
//     // children: List.generate(
//     //     allProducts.length < 4
//     //         ? allProducts.length // length 3
//     //         : 4, (index) {
//     //   return ChangeNotifierProvider.value(
//     //     value: allProducts[index],
//     //     child: const FeedsWidget(),
//     //   );
//     // }),
//     //);
//   }
// }
