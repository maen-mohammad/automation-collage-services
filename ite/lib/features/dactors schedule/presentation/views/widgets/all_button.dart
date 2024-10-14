import 'package:flutter/material.dart';
import 'package:ite/core/utils/colors.dart';

class AllButton extends StatelessWidget {
  const AllButton({super.key, required this.text, required this.color});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 10),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.25,
        height: 50,
        decoration: const BoxDecoration(
            color: mycolor.Thcolor,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: color),
          ),
        ),
      ),
    );
  }
}
