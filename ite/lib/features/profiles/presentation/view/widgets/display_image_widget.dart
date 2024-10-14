import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ite/core/utils/colors.dart';
// import 'package:ite/features/profiles/presentation/view/pages/edit_image.dart';

class DisplayImage extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;
  final Widget iconButton;

  // Constructor
  const DisplayImage({
    Key? key,
    required this.imagePath,
    required this.onPressed,
    required this.iconButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = mycolor.mcolor;

    return Center(
      child: Stack(
        children: [
          buildImage(color),
          Positioned(
            child: buildCircle(child: iconButton, all: 8),
            right: 4,
            top: 100,
          )
        ],
      ),
    );
  }

  // Builds Profile Image
  Widget buildImage(Color color) {
    final image = imagePath.contains('https://')
        ? NetworkImage(imagePath)
        : FileImage(
            File(imagePath),
          );

    return CircleAvatar(
      radius: 75,
      backgroundColor: color,
      child: CircleAvatar(
        backgroundImage: image as ImageProvider,
        radius: 70,
      ),
    );
  }

  // Builds Edit Icon on Profile Picture
  // Widget buildEditIcon(Color color, BuildContext context) => buildCircle(
  //       all: 8,
  //       child: iconButton,
  // IconButton(
  //   onPressed: () {
  //     Route route =
  //         MaterialPageRoute(builder: (context) => EditImagePage());
  //     Navigator.push(context, route).then(onPressed);
  //   },
  //   icon: Icon(
  //     Icons.edit,
  //     color: color,
  //     size: 20,
  //   ),
  // )
  // Icon(
  //   Icons.edit,
  //   color: color,
  //   size: 20,
  // ),
  // );

  // Builds/Makes Circle for Edit Icon on Profile Picture
  Widget buildCircle({
    required Widget child,
    required double all,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: Colors.white,
          child: child,
        ),
      );
}
