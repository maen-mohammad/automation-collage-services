import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ite/core/utils/colors.dart';
import 'package:ite/features/doctors%20labs/data/models/halls_model/hall.dart';
import 'package:ite/features/student%20schedule/presentation/views/widgets/appointment_details_style.dart';

class HallDetails extends StatelessWidget {
  const HallDetails({super.key, required this.hall});
  final Hall hall;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Container(
        height: 40,
        decoration: BoxDecoration(
            color: mycolor.Thcolor, borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Text('معلومات القاعة'),
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
                  hall.projector == 'no' ? 'لا' : 'نعم',
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
                  hall.descreption == 'null' ? 'لا يوجد' : hall.descreption!,
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
