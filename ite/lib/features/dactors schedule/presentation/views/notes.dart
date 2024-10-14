import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ite/core/utils/colors.dart';
import 'package:ite/core/utils/constant.dart';
import 'package:ite/core/utils/custom_app_bar.dart';
import 'package:ite/features/dactors%20schedule/presentation/view%20models/get%20notes/getnotes_cubit.dart';
import 'package:ite/features/dactors%20schedule/presentation/views/widgets/list_notes.dart';
import 'package:ite/features/student%20schedule/presentation/views/widgets/custom_divider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  final TextEditingController textEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: ui.TextDirection.rtl,
        child: Scaffold(
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(Constant.appbarheight),
              child: CustomAppBar(text: 'الملاحظات السابقة')),
          body: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .7,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty) {
                              return 'الرجاء ادخال رقم المجموعة';
                            }
                            return null;
                          },
                          textAlign: ui.TextAlign.center,
                          controller: textEditingController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            labelText: 'رقم المجموعة',
                            labelStyle: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 242, 231, 215),
                            contentPadding: const EdgeInsets.only(right: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: mycolor.tlcolor,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: mycolor.lcolor,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          color: Colors.white,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              BlocProvider.of<GetnotesCubit>(context).getnotes({
                                'group_id': textEditingController.text,
                              });
                            }
                          },
                          icon: Icon(
                            FontAwesomeIcons.magnifyingGlass,
                            size: 24,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                CustomDivider(),
                ListNotes(),
              ],
            ),
          ),
        ));
  }
}
