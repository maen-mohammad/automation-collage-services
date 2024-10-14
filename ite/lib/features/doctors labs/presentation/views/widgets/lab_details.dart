import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ite/core/utils/colors.dart';
import 'package:ite/features/doctors%20labs/data/models/halls_model/hall.dart';
import 'package:ite/features/doctors%20labs/data/models/labs_model/lab.dart';
import 'package:ite/features/student%20schedule/presentation/views/widgets/appointment_details_style.dart';

class LabDetails extends StatelessWidget {
  const LabDetails({
    super.key,
    required this.lab,
  });
  final Lab lab;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Container(
        height: 40,
        decoration: BoxDecoration(
            color: mycolor.Thcolor, borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Text('معلومات المخبر'),
        ),
      ),
      content: Column(
        children: [
          AppointmentDetailsStyle(
            widget: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "وجود عارض",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  lab.projector == 'no' ? 'لا' : 'نعم',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          AppointmentDetailsStyle(
            widget: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "عدد الاجهزة",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  lab.pcNumber.toString(),
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          AppointmentDetailsStyle(
            widget: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "الوصف",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  lab.descreption ?? 'لا يوجد',
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
          textStyle: TextStyle(
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
