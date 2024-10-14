// import 'package:flutter/material.dart';
// import 'package:ite/features/dactors%20schedule/presentation/views/widgets/custom_date.dart';
// import 'package:ite/features/dactors%20schedule/presentation/views/widgets/custom_list_dates.dart';

// class Dates extends StatelessWidget {
//   const Dates({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Dates'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               //physics: const BouncingScrollPhysics(),
//               itemCount: 2,
//               itemBuilder: (context, index) {
//                 return const Padding(
//                   padding: EdgeInsets.only(left: 5, bottom: 10),
//                   child: Row(
//                     children: [
//                       CustomDate(
//                         color: Colors.amber,
//                       ),
//                       SizedBox(
//                         width: 8,
//                       ),
//                       Expanded(
//                         child: CustomListDates(),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
