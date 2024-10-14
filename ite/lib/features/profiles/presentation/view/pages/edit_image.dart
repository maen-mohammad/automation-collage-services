import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ite/core/utils/colors.dart';
import 'package:ite/core/utils/constant.dart';
import 'package:ite/core/utils/custom_app_bar.dart';
import 'package:ite/features/profiles/presentation/view/user/user_data.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:ui' as ui;

class EditImagePage extends StatefulWidget {
  const EditImagePage({Key? key}) : super(key: key);

  @override
  _EditImagePageState createState() => _EditImagePageState();
}

class _EditImagePageState extends State<EditImagePage> {
  var user = UserData.myUser;
  // XFile? _image;
  Future<void> _pickImageFromGallery() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    setState(
      () {
        print("image path : " + user.image);

        if (image == null) return;
        user.image = image.path;
        // _image = image;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(Constant.appbarheight),
          child: CustomAppBar(text: "تحديث صورة الملف الشخصي"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // SizedBox(
            //   width: 330,
            //   child: const Text(
            //     "تحديث صورة الملف الشخصي:",
            //     style: TextStyle(
            //       fontSize: 20,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: SizedBox(
                width: 330,
                height: 330,
                child: GestureDetector(
                  onTap: () => _pickImageFromGallery(),
                  // async {
                  //   final image = await ImagePicker()
                  //       .pickImage(source: ImageSource.gallery);
                  //   if (image == null) return;
                  // final location = await getApplicationDocumentsDirectory();
                  // final name = basename(image.path);
                  // final imageFile = File('${location.path}/$name');
                  // final newImage = await File(image.path).copy(imageFile.path);
                  // setState(() => user = user.copy(imagePath: newImage.path));
                  // },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: (user.image.contains('https://'))
                        ? Image(image: NetworkImage(user.image))
                        : (user.image.isNotEmpty &&
                                !user.image.contains('https://'))
                            ? Image.file(
                                File(user.image),
                                fit: BoxFit.fill,
                              )
                            : Container(
                                width: 100,
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: mycolor.hcolor,
                                ),
                                child: const Icon(
                                  Icons.camera_alt,
                                  color: mycolor.Thcolor,
                                  size: 50.0,
                                ),
                              ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 330,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'تحديث',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
