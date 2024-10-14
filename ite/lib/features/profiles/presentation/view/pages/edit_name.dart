import 'package:flutter/material.dart';
import 'package:ite/core/utils/constant.dart';
import 'package:ite/core/utils/custom_app_bar.dart';
import 'package:ite/features/profiles/presentation/view/user/user_data.dart';
import 'dart:ui' as ui;

// This class handles the Page to edit the Name Section of the User Profile.
class EditNameFormPage extends StatefulWidget {
  const EditNameFormPage({Key? key}) : super(key: key);

  @override
  EditNameFormPageState createState() {
    return EditNameFormPageState();
  }
}

class EditNameFormPageState extends State<EditNameFormPage> {
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();
  var user = UserData.myUser;

  @override
  void dispose() {
    firstNameController.dispose();
    super.dispose();
  }

  void updateUserName(String name) {
    user.name = name;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(Constant.appbarheight),
              child: CustomAppBar(text: 'تحديث الاسم')),
          body: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // SizedBox(
                //   width: 330,
                //   child: const Text(
                //     "What's Your Name?",
                //     style: TextStyle(
                //       fontSize: 25,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 40, 16, 0),
                        child: SizedBox(
                            height: 100,
                            width: 150,
                            child: TextFormField(
                              // Handles Form Validation for First Name
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'الرجاء ادخال الاسم والكنية';
                                }
                                // else if (!isAlpha(value)) {
                                //   return '';
                                // }
                                return null;
                              },
                              decoration:
                                  InputDecoration(labelText: 'الاسم والكنية'),
                              controller: firstNameController,
                            ))),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 40, 16, 0),
                        child: SizedBox(
                            height: 100,
                            width: 150,
                            child: TextFormField(
                              // Handles Form Validation for Last Name
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'الرجاء ادخال اسم الاب';
                                }
                                // else if (!isAlpha(value)) {
                                //   return 'Only Letters Please';
                                // }
                                return null;
                              },
                              decoration:
                                  const InputDecoration(labelText: 'اسم الاب'),
                              controller: secondNameController,
                            )))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 150),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 330,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate()
                              //  && isAlpha(firstNameController.text +
                              //         secondNameController.text)
                              ) {
                            updateUserName(firstNameController.text +
                                " " +
                                secondNameController.text);
                            Navigator.pop(context);
                          }
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
          )),
    );
  }
}
