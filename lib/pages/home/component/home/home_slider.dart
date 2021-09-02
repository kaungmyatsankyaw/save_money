// // import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';

// class HomeSlider extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SliverList(
//         delegate: SliverChildListDelegate([
//       Container(
//         margin: EdgeInsets.only(bottom: 20, top: 20),
//         child: CarouselSlider(
//           options: CarouselOptions(
//             height: 180.0,
//             autoPlay: true,
//           ),
//           items: [1, 2, 3, 4].map((i) {
//             return Builder(
//               builder: (BuildContext context) {
//                 return Container(
//                     width: MediaQuery.of(context).size.width,
//                     margin: EdgeInsets.symmetric(horizontal: 5.0),
//                     decoration: BoxDecoration(color: Colors.amber),
//                     child: Image.asset(
//                       'images/home_slider/s_$i.png',
//                       fit: BoxFit.fill,
//                     ));
//               },
//             );
//           }).toList(),
//         ),
//       )
//     ]));
//   }
// }
