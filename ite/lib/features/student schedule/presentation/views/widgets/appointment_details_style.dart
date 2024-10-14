import 'package:flutter/material.dart';
import 'package:ite/core/utils/colors.dart';

class AppointmentDetailsStyle extends StatelessWidget {
  const AppointmentDetailsStyle({super.key, required this.widget});
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        // height: 80,
        decoration: BoxDecoration(
            color: mycolor.Thcolor.withOpacity(0.6),
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0), child: widget),
      ),
    );
  }
}
