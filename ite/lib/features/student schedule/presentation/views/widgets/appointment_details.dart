import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ite/core/utils/colors.dart';
import 'package:ite/features/student%20schedule/presentation/views/widgets/appointment_details_style.dart';

// ignore: must_be_immutable
class AppointmentDetails extends StatelessWidget {
  AppointmentDetails({super.key, required this.appointment});
  var appointment;
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Container(
          height: 40,
          decoration: BoxDecoration(
              color: mycolor.Thcolor, borderRadius: BorderRadius.circular(12)),
          child: const Center(child: Text('معلومات الموعد'))),
      content: Column(
        children: [
          AppointmentDetailsStyle(
            widget: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  appointment.goal,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  appointment.title,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          AppointmentDetailsStyle(
            widget: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "الحالة",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  appointment.state == 'processing' ? 'قيد المعالجة' : 'مثبت',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                appointment.state == 'processing'
                    ? const Text('التاريخ غير محدد')
                    : Text(
                        appointment.date.toString(),
                        style: const TextStyle(fontSize: 16),
                      ),
                appointment.state == 'processing'
                    ? const Text('الوقت غير محدد')
                    : Text(
                        appointment.from.toString().substring(0, 5),
                        style: const TextStyle(fontSize: 16),
                      ),
              ],
            ),
          ),
          AppointmentDetailsStyle(
            widget: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 1.0, bottom: 5),
                  child: Text(
                    "رقم المجموعة",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  appointment.groupId.toString(),
                  style: const TextStyle(fontSize: 16),
                ),
                // Container(
                //   height: 130,
                //   child:
                // ListView.builder(
                //   padding: EdgeInsets.zero,
                //   itemCount: 10,
                //   itemBuilder: (context, index) {
                //     return Text(
                //       "شرفان محمد",
                //       style: TextStyle(fontSize: 16),
                //     );
                //   },
                // ),
                // ),
              ],
            ),
          ),
          const AppointmentDetailsStyle(
            widget: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "السبب",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "مناقشة",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          isDefaultAction: true,
          textStyle: const TextStyle(
            color: mycolor.lcolor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('رجوع'),
        ),
      ],
    );
  }
}
