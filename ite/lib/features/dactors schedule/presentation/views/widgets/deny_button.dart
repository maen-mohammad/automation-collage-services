import 'package:flutter/material.dart';
import 'package:ite/core/utils/colors.dart';

class DenyButton extends StatelessWidget {
  const DenyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.1,
      decoration: BoxDecoration(
        color: mycolor.Thcolor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        color: Color.fromARGB(255, 160, 36, 36),
        Icons.close,
      ),
    );
  }
}
