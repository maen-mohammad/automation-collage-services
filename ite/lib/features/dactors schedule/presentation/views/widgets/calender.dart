// import 'package:flutter/material.dart';
// import 'package:ite/core/utils/colors.dart';
// import 'package:ite/core/utils/functions.dart';
// import 'package:ite/core/utils/static_variable.dart';
// import 'package:ite/features/dactors%20schedule/data/models/my_appointment/doctor_interview.dart';
// import 'package:ite/features/dactors%20schedule/data/models/my_appointment/my_appointment.dart';
// import 'package:ite/features/dactors%20schedule/presentation/views/appointment_of_day.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:intl/intl.dart';

// class CustomCalander extends StatefulWidget {
//   const CustomCalander({super.key, required this.appointment});
//   final MyAppointment appointment;

//   @override
//   State<StatefulWidget> createState() => _CustomCalander();
// }

// class _CustomCalander extends State<CustomCalander> {
//   List<DateTime> toHighlight(MyAppointment appointment) {
//     return List.generate(
//       10,
//       (index) {
//         return DateTime.now().add(Duration(days: index));
//       },
//     );
//   }

//   void getappointmentday(String date, MyAppointment myappointment) {
//     List<DoctorInterview>? appointment = myappointment.doctorInterview;
//     setState(() {
//       StaticVariable.appointments = appointment!
//           .where((appointment) => appointment.date == date)
//           .toList();
//     });

//     // print(StaticVariable.appointments.toString());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return TableCalendar(
//       locale: 'ar',
//       startingDayOfWeek: StartingDayOfWeek.saturday,
//       onDaySelected: (selectedDay, focusedDay) {
//         selectedDay.day == DateTime.now().day
//             ? Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) {
//                 return AppointmentOfDay();
//               }))
//             : getappointmentday(
//                 '${selectedDay.year}-${selectedDay.month.toString().padLeft(2, '0')}-${selectedDay.day.toString().padLeft(2, '0')}',
//                 widget.appointment);

//         StaticVariable.panelController.open();
//       },
//       calendarBuilders: CalendarBuilders(
//         defaultBuilder: (context, day, focusedDay) {
//           for (DateTime d in toHighlight(widget.appointment)) {
//             if (day.day == d.day &&
//                 day.month == d.month &&
//                 day.year == d.year) {
//               return Stack(children: [
//                 Container(
//                   width: 40,
//                   decoration: const BoxDecoration(
//                     color: mycolor.hcolor,
//                     shape: BoxShape.circle,
//                   ),
//                   child: Center(
//                     child: Text(
//                       Functions.convertToArabicNumbers(day.day.toString()),
//                       style: const TextStyle(color: Colors.black),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   child: ClipOval(
//                     child: Container(
//                       padding: EdgeInsets.all(2),
//                       color: Color(0xFF806C55),
//                       child: Text(
//                         Functions.convertToArabicNumbers('99'),
//                         style: TextStyle(fontSize: 12, color: Colors.white),
//                       ),
//                     ),
//                   ),
//                   right: 0,
//                   top: 0,
//                 )
//               ]);
//             }
//           }
//           return null;
//         },
//       ),
//       headerStyle:
//           const HeaderStyle(formatButtonVisible: false, titleCentered: true),
//       firstDay: DateTime.now(),
//       lastDay: DateTime.now().add(Duration(days: 100)),
//       focusedDay: DateTime.now(),
//     );
//   }
// }
