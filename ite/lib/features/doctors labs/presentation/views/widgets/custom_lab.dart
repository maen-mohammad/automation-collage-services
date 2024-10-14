// import 'dart:ui';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:ite/core/utils/colors.dart';
// import 'package:ite/features/doctors%20labs/presentation/views/widgets/custom_icon.dart';
// import 'package:ite/features/doctors%20labs/presentation/views/widgets/hall_details.dart';
// import 'package:ite/features/doctors%20labs/presentation/views/widgets/lab_name.dart';
// import 'package:ite/features/doctors%20labs/presentation/views/widgets/maintenanse.dart';
// import 'package:ite/features/doctors%20labs/presentation/views/widgets/reserve_lab.dart';
// import 'package:ite/features/student%20schedule/presentation/views/widgets/add_button.dart';

// class CustomLab extends StatelessWidget {
//   const CustomLab({super.key, this.maintenanse});
//   final String? maintenanse;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 4.0),
//       child: Container(
//         width: 140,
//         height: 140,
//         decoration: BoxDecoration(
//             gradient: LinearGradient(
//                 begin: Alignment.topRight,
//                 end: Alignment.bottomLeft,
//                 colors: [mycolor.hcolor.withOpacity(.5), mycolor.hcolor]),
//             borderRadius: BorderRadius.circular(12)),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 CustomIcon(icon: Icons.laptop_chromebook_rounded),
//                 LabName(text: 'B1')
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     showCupertinoModalPopup<void>(
//                       context: context,
//                       builder: (BuildContext context) => const LabDetails(),
//                     );
//                   },
//                   child: AddButton(
//                     text: 'تفاصيل',
//                     height: 30,
//                     width: 60,
//                     fontsize: 14,
//                     color: mycolor.mcolor,
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     (maintenanse == null)
//                         ? showCupertinoModalPopup<void>(
//                             context: context,
//                             builder: (BuildContext context) =>
//                                 const ReserveLab(),
//                           )
//                         : showCupertinoModalPopup<void>(
//                             context: context,
//                             builder: (BuildContext context) =>
//                                 const Maintenanse(),
//                           );
//                   },
//                   child: AddButton(
//                     text: (maintenanse == null) ? 'حجز' : 'صيانة',
//                     height: 30,
//                     width: 60,
//                     fontsize: 14,
//                     color: mycolor.mcolor,
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
    
//   }
// }
