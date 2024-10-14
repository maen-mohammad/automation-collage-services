import 'package:flutter/material.dart';

class LabName extends StatelessWidget {
  const LabName({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
