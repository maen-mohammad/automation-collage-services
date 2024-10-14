import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ite/core/utils/colors.dart';
import 'package:ite/core/utils/constant.dart';
import 'package:ite/core/utils/custom_app_bar.dart';
import 'package:ite/features/profiles/presentation/view/pages/edit_description.dart';
import 'package:ite/features/profiles/presentation/view/pages/edit_email.dart';
import 'package:ite/features/profiles/presentation/view/pages/edit_image.dart';
import 'package:ite/features/profiles/presentation/view/pages/edit_name.dart';
import 'package:ite/features/profiles/presentation/view/pages/edit_phone.dart';
import 'package:ite/features/profiles/presentation/view/pages/edit_specialization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../user/user.dart';
import '../widgets/display_image_widget.dart';
import '../user/user_data.dart';

// This class handles the Page to dispaly the user's info on the "Edit Profile" Screen
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserData.myUser;
    setState(() {});
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(Constant.appbarheight),
          child: CustomAppBar(
            text: 'الملف الشخصي',
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // AppBar(
            //   backgroundColor: Colors.transparent,
            //   elevation: 0,
            //   toolbarHeight: 10,
            // ),
            // Center(
            //   child: Padding(
            //     padding: EdgeInsets.only(bottom: 20),
            //     child: Text(
            //       'الملف الشخصي',
            //       style: TextStyle(
            //         fontSize: 30,
            //         fontWeight: FontWeight.w700,
            //         color: mycolor.mcolor,
            //         // Color.fromRGBO(64, 105, 225, 1),
            //       ),
            //     ),
            //   ),
            // ),
            Container(
              // onTap: () {
              //   // print(user.image);
              //   navigateSecondPage(EditImagePage());
              // },
              child: DisplayImage(
                imagePath: user.image,
                onPressed: () {},
                iconButton: SizedBox(
                  height: 20,
                  width: 20,
                  child: IconButton(
                    onPressed: () {
                      navigateSecondPage(EditImagePage());
                    },
                    padding: EdgeInsets.zero,
                    iconSize: 20,
                    icon: Icon(
                      Icons.edit,
                      color: mycolor.mcolor,
                      // size: 20,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            UserInfoDisplay(user.name, 'الاسم', EditNameFormPage(),
                FontAwesomeIcons.person),
            UserInfoDisplay('هندسة البرمجيات', 'التخصص', EditSpecialization(),
                FontAwesomeIcons.userGraduate),
            SizedBox(
              height: 5,
            ),
            UserInfoDisplay(user.phone, 'رقم واتساب', EditPhoneFormPage(),
                FontAwesomeIcons.whatsapp),
            SizedBox(
              height: 5,
            ),

            SizedBox(
              height: 5,
            ),
            UserInfoDisplay(user.email, 'Email', EditEmailFormPage(),
                FontAwesomeIcons.envelope),
            // Expanded(
            //   child: buildAbout(user),
            //   flex: 4,
            // )
          ],
        ),
      ),
    );
  }

  // Widget builds the display item with the proper formatting to display the user's info
  Widget UserInfoDisplay(
          String getValue, String title, Widget editPage, IconData icon) =>
      Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   title,
              //   style: TextStyle(
              //     fontSize: 15,
              //     fontWeight: FontWeight.w500,
              //     color: Colors.grey,
              //   ),
              // ),
              SizedBox(
                height: 1,
              ),
              Container(
                  width: 350,
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ))),
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Icon(
                        icon,
                        color: mycolor.lcolor,
                        size: 28.0,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          getValue,
                          style: TextStyle(fontSize: 16, height: 3),
                        ),
                      ),
                      //  TextButton(
                      //   onPressed: () {
                      //     navigateSecondPage(editPage);
                      //   },
                      //   child: Text(
                      //     getValue,
                      //     style: TextStyle(fontSize: 16, height: 1.4),
                      //   ),
                      // ),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        navigateSecondPage(editPage);
                      },
                      icon: Icon(
                        FontAwesomeIcons.angleLeft,
                        color: mycolor.mcolor,
                        size: 30.0,
                      ),
                    ),
                  ]))
            ],
          ));

  // Widget builds the About Me Section
  Widget buildAbout(User user) => Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tell Us About Yourself',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 1),
          Container(
              width: 350,
              height: 200,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.grey,
                width: 1,
              ))),
              child: Row(children: [
                Expanded(
                    child: TextButton(
                        onPressed: () {
                          navigateSecondPage(EditDescriptionFormPage());
                        },
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  user.aboutMeDescription,
                                  style: TextStyle(
                                    fontSize: 16,
                                    height: 1.4,
                                  ),
                                ))))),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                  size: 40.0,
                )
              ]))
        ],
      ));

  // Refrshes the Page after updating user info.
  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  // Handles navigation and prompts refresh.
  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then(onGoBack);
  }
}
