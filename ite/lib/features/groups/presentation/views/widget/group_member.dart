// import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ite/core/utils/colors.dart';
import 'package:ite/features/groups/presentation/view%20models/create%20group%20cubit/create_group_cubit.dart';
import 'package:ite/features/groups/presentation/view%20models/get%20mygroup%20cubit/get_mygroup_cubit.dart';
// import 'package:ite/features/student%20schedule/presentation/views/widgets/appointment_details_style.dart';
// import 'package:ite/features/student%20schedule/presentation/views/widgets/custom_textfield.dart';
import 'dart:ui' as ui;

import 'package:flutter_bloc/flutter_bloc.dart';

class GroupMember extends StatefulWidget {
  @override
  State<GroupMember> createState() => _GroupMemberState();
}

class _GroupMemberState extends State<GroupMember> {
  final student1 = TextEditingController();

  final student2 = TextEditingController();

  final student3 = TextEditingController();

  final student4 = TextEditingController();

  final student5 = TextEditingController();

  final student6 = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Form(
        key: _formKey,
        child: CupertinoAlertDialog(
          title: Container(
            height: 40,
            decoration: BoxDecoration(
                color: mycolor.Thcolor,
                borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: Text('اضافة أعضاء مجموعة'),
            ),
          ),
          content: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Card(
                      elevation: 0,
                      color: Colors.white.withOpacity(0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: customtextformfield(
                                controller: student1, hinttext: 'الطالب الاول'),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: customtextformfield(
                                controller: student2,
                                hinttext: 'الطالب الثاني'),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: customtextformfield(
                                controller: student3,
                                hinttext: 'الطالب الثالث'),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: customtextformfield(
                                controller: student4,
                                hinttext: 'الطالب الرابع'),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: customtextformfield(
                                controller: student5,
                                hinttext: 'الطالب الخامس'),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: customtextformfield(
                                controller: student6,
                                hinttext: 'الطالب السادس'),
                          ),
                        ],
                      )),
                ],
              ),
            ],
          ),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              isDefaultAction: true,
              textStyle: TextStyle(
                color: mycolor.lcolor,
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  BlocProvider.of<CreateGroupCubit>(context).creategroups([
                    student1.text,
                    student2.text,
                    student3.text,
                    student4.text,
                    student5.text,
                    student6.text,
                  ]);

                  BlocProvider.of<GetMygroupCubit>(context).getgroups();
                  Navigator.pop(context);
                }
                // Navigator.pop(context);
              },
              child: const Text('انشاء'),
            ),
          ],
        ),
      ),
    );
  }

  Widget customtextformfield({
    required TextEditingController controller,
    required String hinttext,
    // required int type ,
  }) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'الرجاء ادخال هذا الحقل';
        }

        return null;
      },

      controller: controller,
      // (type == 1)? student1: (type == 2)? student2 :(type == 3)? student3 :(type == 4)? student4:(type == 5)? student5:student6,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          // Set the outline border
          borderRadius: BorderRadius.circular(15.0), // Set the border radius
        ),
        filled: true,
        fillColor: Color.fromARGB(255, 242, 231, 215),
        labelText: hinttext,
        labelStyle: TextStyle(
          color: Colors.black, // تعيين لون الملصق
          fontWeight: FontWeight.bold, // تعيين سماكة الخط
          fontSize: 16.0,
        ),
        contentPadding: EdgeInsets.only(right: 8.0),
        focusedBorder: OutlineInputBorder(
          // Set the focused border
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(
            color: Color(0xffe46b10), // Set the focused border color
            width: 2.0, // Set the focused border width
          ),
        ),
      ),
    );
  }
}
