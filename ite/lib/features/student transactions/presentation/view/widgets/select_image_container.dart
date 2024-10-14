import 'package:flutter/material.dart';
import 'package:ite/core/utils/colors.dart';

class SelectImageContainer extends StatelessWidget {
  const SelectImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: mycolor.hcolor,
      ),
      child: Icon(
        Icons.camera_alt,
        color: mycolor.Thcolor,
        size: 50.0,
      ),
    );
  }
}
