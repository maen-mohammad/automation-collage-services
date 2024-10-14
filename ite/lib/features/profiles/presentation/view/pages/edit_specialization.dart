import 'package:flutter/material.dart';
import 'package:ite/core/utils/constant.dart';
import 'package:ite/core/utils/custom_app_bar.dart';
// import 'package:ite/features/profiles/presentation/view/pages/edit_description.dart';
import 'package:ite/features/profiles/presentation/view/user/user_data.dart';
// import 'package:ite/features/profiles/presentation/view/widgets/appbar_widget.dart';
// import 'package:string_validator/string_validator.dart';
import 'dart:ui' as ui;

// This class handles the Page to edit the Name Section of the User Profile.
class EditSpecialization extends StatefulWidget {
  const EditSpecialization({Key? key}) : super(key: key);

  @override
  EditSpecializationState createState() {
    return EditSpecializationState();
  }
}

class EditSpecializationState extends State<EditSpecialization> {
  final _formKey = GlobalKey<FormState>();
  final specializationcontroller = TextEditingController();
  var user = UserData.myUser;

  @override
  void dispose() {
    specializationcontroller.dispose();
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
              child: CustomAppBar(text: 'تحديث التخصص')),
          body: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 40, 16, 0),
                    child: SizedBox(
                        height: 100,
                        // width: 150,
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 4,
                          // Handles Form Validation for First Name
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'الرجاء ادخال تخصص';
                            }
                            return null;
                          },
                          decoration: InputDecoration(labelText: 'التخصص'),
                          controller: specializationcontroller,
                        ))),
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
                          if (_formKey.currentState!.validate()) {
                            updateUserName(specializationcontroller.text);
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
