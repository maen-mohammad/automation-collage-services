import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ite/core/utils/colors.dart';
import 'package:ite/features/student%20schedule/presentation/views/widgets/appointment_details_style.dart';
import 'package:ite/features/student%20schedule/presentation/views/widgets/custom_textfield.dart';

class CancelReseve extends StatelessWidget {
  const CancelReseve({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Container(
        height: 40,
        decoration: BoxDecoration(
            color: mycolor.Thcolor, borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Text('الغاء الحجز'),
        ),
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
          child: const Text('تأكيد'),
        ),
      ],
    );
  }
}
