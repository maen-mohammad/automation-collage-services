import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ite/core/utils/colors.dart';
import 'package:ite/core/utils/failurmsg.dart';
import 'package:ite/core/utils/loadingresponse.dart';
import 'package:ite/features/dactors%20schedule/presentation/view%20models/addnote/addnote_cubit.dart';
import 'package:ite/features/student%20schedule/presentation/views/widgets/appointment_details_style.dart';
import 'dart:ui' as ui;

class Addnote extends StatelessWidget {
  Addnote({super.key, required this.id});

  final int id;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController textEditingController = TextEditingController();
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
            child:const Center(
              child: Text('اضافة ملاحظة'),
            ),
          ),
          content: Column(
            children: [
              AppointmentDetailsStyle(
                widget: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Text(
                    //   "اضافة طلب",
                    //   style: TextStyle(
                    //     fontSize: 16,
                    //     fontWeight: FontWeight.w600,
                    //   ),
                    // ),
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
                            fillColor:const Color.fromARGB(255, 242, 231, 215),
                            labelText: 'الملاحظة',
                            labelStyle:const TextStyle(
                              color: Colors.black, // تعيين لون الملصق
                              fontWeight: FontWeight.bold, // تعيين سماكة الخط
                              fontSize: 16.0,
                            ),
                            contentPadding:const EdgeInsets.only(right: 8.0),
                            focusedBorder: OutlineInputBorder(
                              // Set the focused border
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide:const  BorderSide(
                                color: mycolor.tlcolor, // Set the focused border color
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
              textStyle:const TextStyle(
                color: mycolor.lcolor,
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  BlocProvider.of<AddnoteCubit>(context).addnote(
                      {'interview_id': id, 'note': textEditingController.text});
                  Navigator.pop(context);
                  // BlocProvider.of<AddReserveCubit>(context).addreserve({
                  //   'date': date,
                  //   'from': start,
                  //   'to': end,
                  //   'place': name,
                  //   'reason': textEditingController.text,
                  // });
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
                        child: BlocBuilder<AddnoteCubit, AddnoteState>(
                          builder: (context, state) {
                            if (state is AddnoteLoading) {
                              return const Loadingresponse();
                            } else if (state is AddnoteFailure) {
                              return Failurmsg(msg: state.errormsg);
                            } else if (state is AddnoteSuccess) {
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
