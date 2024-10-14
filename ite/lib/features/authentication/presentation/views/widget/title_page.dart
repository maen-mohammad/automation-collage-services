import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitlePage extends StatefulWidget {
  const TitlePage({super.key});

  @override
  State<TitlePage> createState() => _TitlePageState();
}

class _TitlePageState extends State<TitlePage> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'ITE',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Color(0xffe46b10)),
          children: [
            TextSpan(
              text: 'collage',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            // TextSpan(
            //   text: 'rnz',
            //   style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
            // ),
          ]),
    );
  }
}
