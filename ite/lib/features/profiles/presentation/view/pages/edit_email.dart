import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:ite/core/utils/constant.dart';
import 'package:ite/core/utils/custom_app_bar.dart';
import 'package:ite/features/profiles/presentation/view/user/user_data.dart';
// import 'package:ite/features/profiles/presentation/view/widgets/appbar_widget.dart';
import 'dart:ui' as ui;

// This class handles the Page to edit the Email Section of the User Profile.
class EditEmailFormPage extends StatefulWidget {
  const EditEmailFormPage({Key? key}) : super(key: key);

  @override
  EditEmailFormPageState createState() {
    return EditEmailFormPageState();
  }
}

class EditEmailFormPageState extends State<EditEmailFormPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  var user = UserData.myUser;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void updateUserValue(String email) {
    user.email = email;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(Constant.appbarheight),
              child: CustomAppBar(text: 'تحديث البريد الالكتروني')),
          body: Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: SizedBox(
                          height: 100,
                          width: 320,
                          child: TextFormField(
                            // Handles Form Validation
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'الرجاء ادخال البريد الالكتروني';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                labelText: 'بريدك الالكتروني'),
                            controller: emailController,
                          ))),
                  Padding(
                      padding: EdgeInsets.only(top: 150),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: 320,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                // Validate returns true if the form is valid, or false otherwise.
                                if (_formKey.currentState!.validate() &&
                                    EmailValidator.validate(
                                        emailController.text)) {
                                  updateUserValue(emailController.text);
                                  Navigator.pop(context);
                                }
                              },
                              child: const Text(
                                'تحديث',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          )))
                ]),
          )),
    );
  }
}
