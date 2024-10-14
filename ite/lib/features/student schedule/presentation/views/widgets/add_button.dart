import 'package:flutter/material.dart';
// import 'package:ite/core/utils/colors.dart';

class AddButton extends StatelessWidget {
  const AddButton(
      {super.key,
      required this.text,
      required this.height,
      required this.width,
      required this.fontsize,
      required this.color});
  final String text;
  final double height;
  final double width;
  final double fontsize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontsize,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
