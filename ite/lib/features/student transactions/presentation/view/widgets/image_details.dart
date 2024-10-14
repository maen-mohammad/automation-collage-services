// import 'package:flutter/material.dart';
// import 'package:ite/features/doctors%20labs/presentation/views/widgets/title_labs.dart';
// import 'package:ite/features/student%20transactions/presentation/view/widgets/image_selected.dart';
// import 'package:ite/features/student%20transactions/presentation/view/widgets/select_image_container.dart';
// import 'package:image_picker/image_picker.dart';

// class ImageDetails extends StatefulWidget {
//   const ImageDetails({super.key, required this.title});
//   final String title;
//   @override
//   State<ImageDetails> createState() => _ImageDetailsState();
// }

// class _ImageDetailsState extends State<ImageDetails> {
//   XFile? _image;

//   // XFile? imageFile;

//   // _openGallery() async {
//   //   imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//   //   setState(() {});
//   // }

//   Future<void> _pickImageFromGallery() async {
//     final image = await ImagePicker().pickImage(
//       source: ImageSource.gallery,
//     );
//     setState(
//       () {
//         _image = image;
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         Container(
//             width: MediaQuery.of(context).size.width * .35,
//             child: TitleLabs(text: widget.title)),
//         Container(
//           width: MediaQuery.of(context).size.width * .5,
//           height: MediaQuery.of(context).size.width * .5,
//           child: GestureDetector(
//             onTap: () => _pickImageFromGallery(),
//             child: _image == null
//                 ? SelectImageContainer()
//                 : ImageSelected(
//                     path: _image!.path,
//                   ),
//           ),
//         )
//       ],
//     );
//   }
// }
