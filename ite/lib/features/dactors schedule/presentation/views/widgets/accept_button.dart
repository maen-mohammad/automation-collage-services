import 'package:flutter/material.dart';
import 'package:ite/core/utils/colors.dart';

class AcceptButton extends StatelessWidget {
  const AcceptButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.1,
      decoration: BoxDecoration(
          color: mycolor.Thcolor, borderRadius: BorderRadius.circular(12)),
      child: Icon(
        color: mycolor.lcolor,
        //  Color.fromARGB(255, 73, 106, 224),
        Icons.check,
      ),
    );
  }
}
