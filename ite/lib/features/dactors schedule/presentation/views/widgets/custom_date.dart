import 'package:flutter/material.dart';

class CustomDate extends StatelessWidget {
  final Color color;
  const CustomDate({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('2:00'), Text('4:00')],
      ),
    );
  }
}
