import 'package:flutter/material.dart';
import 'package:ite/core/utils/colors.dart';

class CustomTransaction extends StatelessWidget {
  const CustomTransaction({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        width: 140,
        height: 140,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [mycolor.hcolor.withOpacity(.5), mycolor.hcolor]),
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 50,
              child: Icon(
                Icons.note_add_sharp,
                color: mycolor.lcolor.withOpacity(.6),
                size: 70,
              ),
            ),
            Divider(
              color: mycolor.mcolor.withOpacity(.8),
              thickness: 1,
              height: 10,
              endIndent: 10,
              indent: 10,
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}
