import 'package:flutter/material.dart';

class Failurmsg extends StatelessWidget {
  const Failurmsg({super.key, required this.msg});
  final String msg;
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(msg),
    );
  }
}
