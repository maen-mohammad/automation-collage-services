// import 'package:flutter/material.dart';
// import 'package:ite/core/utils/colors.dart';

// class ApointmentDetails extends StatelessWidget {
//   const ApointmentDetails({super.key});

//   @override
//   Widget build(BuildContext context) {
//     int hour = DateTime.now().hour;
//     int minut = DateTime.now().minute;
//     return Container(
//       width: MediaQuery.of(context).size.width * 0.7,
//       height: 60,
//       decoration: BoxDecoration(
//         color: mycolor.Thcolor,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Text("معن محمد"),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Text('$hour:$minut'),
//               Text('$hour:$minut'),
//             ],
//           ),
//           Text("مشروع 2"),
//         ],
//       ),
//     );
//   }
// }
