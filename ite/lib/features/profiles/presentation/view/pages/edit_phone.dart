import 'package:flutter/material.dart';
import 'package:ite/core/utils/constant.dart';
import 'package:ite/core/utils/custom_app_bar.dart';
import 'package:ite/features/profiles/presentation/view/user/user_data.dart';
// import 'package:ite/features/profiles/presentation/view/widgets/appbar_widget.dart';
import 'package:string_validator/string_validator.dart';
import 'dart:ui' as ui;

// This class handles the Page to edit the Phone Section of the User Profile.
class EditPhoneFormPage extends StatefulWidget {
  const EditPhoneFormPage({Key? key}) : super(key: key);
  @override
  EditPhoneFormPageState createState() {
    return EditPhoneFormPageState();
  }
}

class EditPhoneFormPageState extends State<EditPhoneFormPage> {
  final _formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  var user = UserData.myUser;

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  void updateUserValue(String phone) {
    user.phone = phone;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(Constant.appbarheight),
              child: CustomAppBar(text: 'تحديث الرقم')),
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
                                return 'الرجاء ادخال الرقم';
                              } else if (isAlpha(value)) {
                                return 'ارقام فقط';
                              } else if (value.length < 10) {
                                return 'الرجاء ادخال عشرة ارقام على الاقل';
                              }
                              return null;
                            },
                            controller: phoneController,
                            decoration: const InputDecoration(
                              labelText: 'ادخل رقمك',
                            ),
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
                                    isNumeric(phoneController.text)) {
                                  updateUserValue(phoneController.text);
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
