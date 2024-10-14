import 'package:flutter/material.dart';
import 'package:ite/core/utils/colors.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 40,
      width: 20,
      child: Icon(
        icon,
        size: 30,
        color: mycolor.lcolor,
      ),
    );
  }
}
