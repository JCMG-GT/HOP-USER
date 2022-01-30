// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:hopapp/src/pages/tab_map/maps_sample.dart';
// import 'package:hopapp/src/pages/subpage/resumenProd.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class HomePage2 extends StatefulWidget {
//   @override
//   _HomePage2State createState() => _HomePage2State();
// }

// class _HomePage2State extends State<HomePage2> {
//   Widget swit = MapSample();

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return WillPopScope(
//       onWillPop: () {
//         return Future.value(false);
//       },
//       child: Scaffold(
//         body: Container(
//           width: size.width,
//           height: size.height,
//           child: Stack(
//             children: [
//               _butttonNavigationCurved(size),
//               _containerPrincipal(size),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Container _containerPrincipal(Size size) {
//     return Container(
//       width: size.width,
//       height: size.height * 0.90,
//       child: ClipRRect(
//           borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(40),
//             bottomRight: Radius.circular(40),
//           ),
//           child: swit //swit
//           ),
//     );
//   }

//   void widgetTipo(int tipo) {
//     if (tipo == 1) {
//       setState(() {
//         swit = MapSample();
//       });
//     } else if (tipo == 2) {
//       setState(() {
//         // swit = Discover();
//       });
//     } else if (tipo == 3) {
//       setState(() {
//         swit = ResumenCompras();
//       });
//     }
//   }

//   Widget _butttonNavigationCurved(Size size) {
//     final altura = size.height * 0.2;
//     return Positioned(
//       bottom: 0,
//       right: 0,
//       left: 0,
//       child: Container(
//         width: size.width,
//         height: altura,
//         decoration: BoxDecoration(
//             color: Colors.blue,
//             gradient: LinearGradient(colors: [
//               Color.fromRGBO(85, 41, 161, 1),
//               Color.fromRGBO(57, 74, 207, 1),
//               Color.fromRGBO(45, 91, 230, 1),
//               Color.fromRGBO(38, 99, 242, 1),
//               Color.fromRGBO(31, 108, 249, 1),
//             ])),
//         child: Stack(
//           children: [
//             Positioned(
//               bottom: 2,
//               right: 0,
//               left: 0,
//               child: Container(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     tabBar(() {
//                       widgetTipo(2);
//                     }, "assets/icons/tarro.svg", altura * 0.3, 1),
//                     Container(
//                       width: 0.2,
//                       height: altura / 2,
//                       color: Colors.grey,
//                     ),
//                     tabBar(() {
//                       widgetTipo(1);
//                     }, "assets/icons/gps.svg", altura * 0.3, 1),
//                     Container(
//                       width: 0.2,
//                       height: altura / 2,
//                       color: Colors.grey,
//                     ),
//                     tabBar(() {
//                       //widgetTipo(3);
//                       Navigator.pushNamed(context, 'QrPayment');
//                     }, "assets/icons/hop.png", altura * 0.4, 2),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget tabBar(Function onPressed, String ruta, size, int tipo) {
//     return Expanded(
//       flex: 1,
//       child: GestureDetector(
//         child: Container(
//           height: size,
//           child: Container(
//             margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//             /* margin: EdgeInsets.only(
//                 top: size / 2,
//               ), */
//             child: tipo == 1
//                 ? SvgPicture.asset(
//                     ruta,
//                   )
//                 : Image.asset(ruta),
//           ),
//         ),
//         onTap: onPressed as void Function()?,
//       ),
//     );
//   }
// }
