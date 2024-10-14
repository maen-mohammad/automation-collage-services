import 'dart:io';

import 'package:flutter/material.dart';

class ImageSelected extends StatelessWidget {
  const ImageSelected({super.key, required this.path});
  final String path;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.file(
        File(path),
        fit: BoxFit.fill,
      ),
    );
  }
}
