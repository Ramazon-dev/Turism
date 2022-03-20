// import 'package:flutter/material.dart';
// import 'package:mobileapp/core/components/exporting_packages.dart';

// class HotelsView extends StatelessWidget {
//   VoidCallback ontap;
//   int itemCount;
//   String hotelName;
//   int starCount;
//   String image;
//   HotelsView({
//     required this.ontap,
//     required this.itemCount,
//     required this.hotelName,
//     required this.image,
//     required this.starCount,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: getHeight(154.0),
//       child: ListView.builder(
//         itemCount: itemCount,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: MyEdgeInsets.all(8.0),
//             child: InkWell(
//               onTap: ontap,
//               child: Container(
//                 alignment: Alignment.bottomLeft,
//                 height: getHeight(150.0),
//                 width: getWidth(111.0),
//                 decoration: MyDecoration.netImage(netImage: image),
//                 child: Padding(
//                       padding:
//                           MyEdgeInsets.only(right: 20, top: 5.0, bottom: 5.0),
//                       child: Text(
//                         hotelName,
//                         style: TextStyle(
//                             fontSize: getWidth(10.0), color: Colors.white),
//                       ),
//                     )
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
