import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ite/core/utils/colors.dart';
import 'package:ite/features/doctors%20labs/presentation/view%20model/add%20complaint/add_complaint_cubit.dart';
import 'package:ite/features/student%20schedule/presentation/views/widgets/appointment_details_style.dart';
import 'dart:ui' as ui;

import 'package:flutter_bloc/flutter_bloc.dart';

class Maintenanse extends StatelessWidget {
  Maintenanse({super.key, required this.name});
  final String name;
  final TextEditingController textEditingController = TextEditingController();
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
              child: Text('تقديم طلب صيانة'),
            ),
          ),
          content: Column(
            children: [
              AppointmentDetailsStyle(
                widget: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "اضافة طلب",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Card(
                        elevation: 0,
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 4,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'الرجاء ادخال هذا الحقل';
                            }

                            return null;
                          },

                          controller: textEditingController,
                          // (type == 1)? student1: (type == 2)? student2 :(type == 3)? student3 :(type == 4)? student4:(type == 5)? student5:student6,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              // Set the outline border
                              borderRadius: BorderRadius.circular(
                                  15.0), // Set the border radius
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 242, 231, 215),
                            labelText: 'المشكلة',
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
                                color: Color(
                                    0xffe46b10), // Set the focused border color
                                width: 2.0, // Set the focused border width
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
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
                  BlocProvider.of<AddComplaintCubit>(context).addcomplaint({
                    'place': name,
                    'descreption': textEditingController.text
                  });
                  print(textEditingController.text + name);
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      actions: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('حسناً'),
                          ),
                        ),
                      ],
                      content: SizedBox(
                        height: 100,
                        child:
                            BlocBuilder<AddComplaintCubit, AddComplaintState>(
                          builder: (context, state) {
                            if (state is AddComplaintLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (state is AddComplaintFailure) {
                              return Center(
                                child: Text(state.errormsg),
                              );
                            } else if (state is AddComplaintSuccess) {
                              return Center(
                                child: Text(
                                  state.msg,
                                  textDirection: TextDirection.rtl,
                                ),
                              );
                            }
                            return Container();
                          },
                        ),
                      ),
                    ),
                  );
                }
                // Navigator.pop(context);
              },
              child: const Text('تأكيد'),
            ),
          ],
        ),
      ),
    );
  }
}
