import 'package:flutter/cupertino.dart';
import 'package:ite/core/utils/colors.dart';
import 'package:ite/features/dactors%20schedule/data/models/my_appointment/doctor_interview.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key, required this.appointment});
  final DoctorInterview appointment;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Container(
          height: 40,
          decoration: BoxDecoration(
              color: mycolor.Thcolor, borderRadius: BorderRadius.circular(12)),
          child: Center(child: Text('معلومات الموعد'))),
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              decoration: BoxDecoration(
                  color: mycolor.Thcolor.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    appointment.goal!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    appointment.title!,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              // height: 80,
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: mycolor.Thcolor.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'الطلاب',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(appointment.group!.student1!),
                  Text(appointment.group!.student2!),
                  Text(appointment.group!.student3!),
                  Text(appointment.group!.student4!),
                  Text(appointment.group!.student5!),
                  Text(appointment.group!.student6!),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: mycolor.Thcolor.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
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
                    appointment.reason,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          isDestructiveAction: true,
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
