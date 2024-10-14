import 'package:flutter/material.dart';
import 'package:ite/core/utils/colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: const EdgeInsets.only(
        right: 16.0,
        left: 16.0,
        top: 0.0,
        bottom: 0.0,
      ),
      child: Divider(color: mycolor.lcolor),
    );
  }
}
