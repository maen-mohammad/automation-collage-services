import 'package:flutter/material.dart';
import 'package:ite/core/utils/constant.dart';
import 'package:ite/core/utils/custom_app_bar.dart';
import 'package:ite/features/student%20schedule/data/models/doctors/doctor.dart';
import 'package:ite/features/student%20schedule/presentation/view%20models/add%20appointement/creat_appointment_cubit.dart';
import 'package:ite/features/student%20schedule/presentation/view%20models/get%20doctors/getdoctors_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//  List.generate(5, (index) {
//   return 'mioj';
// });

class AddAppointment extends StatefulWidget {
  const AddAppointment({super.key});

  @override
  State<AddAppointment> createState() => _AddAppointmentState();
}

class _AddAppointmentState extends State<AddAppointment> {
  final titleController = TextEditingController();

  final groupidcontroller = TextEditingController();

  final nameController = TextEditingController();

  final numberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String? selectedoctor = 'أبي صندوق';
  Doctor? selectedoctor1;
  String? selectedproject = 'مشروع 3';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(Constant.appbarheight),
            child: CustomAppBar(
              text: 'اضافة موعد',
            ),
          ),
          // bottomNavigationBar: CustomBottomNavigationBar(),
          body: BlocBuilder<GetdoctorsCubit, GetdoctorsState>(
            builder: (context, state) {
              if (state is GetdoctorsFailure) {
                return Center(
                  child: Text(state.errormsg),
                );
              } else if (state is GetdoctorsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetdoctorsSuccess) {
                // selectedoctor1 = state.doctors.doctors?.first;
                return Form(
                  key: _formKey,
                  child: SizedBox(
                    height: height,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const SizedBox(
                              height: 50,
                            ),
                            DropdownButtonFormField<Doctor>(
                              value: selectedoctor1,
                              items: state.doctors.doctors!
                                  .map<DropdownMenuItem<Doctor>>(
                                      (Doctor value) {
                                return DropdownMenuItem<Doctor>(
                                  value: value,
                                  child: Align(
                                      alignment: Alignment.topRight,
                                      child: Text(value.name!)),
                                );
                              }).toList(),
                              onChanged: (Doctor? newValue) {
                                setState(() {
                                  selectedoctor1 = newValue!;
                                });
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 242, 231, 215),
                                labelText: 'الدكتور',
                                labelStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                                contentPadding:
                                    const EdgeInsets.only(right: 16.0),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: const BorderSide(
                                    color: Color(0xffe46b10),
                                    width: 2.0,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            DropdownButtonFormField<String>(
                              value: selectedproject,
                              items: <String>[
                                'مشروع 3',
                                'مشروع 2',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Align(
                                      alignment: Alignment.topRight,
                                      child: Text(value)),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedproject = newValue!;
                                });
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 242, 231, 215),
                                labelText: 'المشروع',
                                labelStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                                contentPadding:
                                    const EdgeInsets.only(right: 16.0),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: const BorderSide(
                                    color: Color(0xffe46b10),
                                    width: 2.0,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            customtextformfield(
                                controller: titleController,
                                hinttext: 'عنوان المشروع',
                                obscureText: false,
                                type: 'code'),
                            const SizedBox(
                              height: 20,
                            ),

                            customtextformfield(
                                controller: groupidcontroller,
                                hinttext: 'رقم المجموعة',
                                obscureText: false,
                                type: 'email'),

                            // EmailPasswordWidget(),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                // Validate returns true if the form is valid, or false otherwise.
                                if (_formKey.currentState!.validate()) {
                                  BlocProvider.of<CreatAppointmentCubit>(
                                          context)
                                      .createappointment([
                                    groupidcontroller.text,
                                    selectedoctor1?.id,
                                    selectedproject,
                                    titleController.text
                                  ]);
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      actions: <Widget>[
                                        Align(
                                          alignment: Alignment.center,
                                          child: TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: const Text('حسناً'),
                                          ),
                                        ),
                                      ],
                                      content: SizedBox(
                                        height: 100,
                                        child: BlocBuilder<
                                            CreatAppointmentCubit,
                                            CreatAppointmentState>(
                                          builder: (context, state) {
                                            if (state
                                                is CreatAppointmentLoading) {
                                              return const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            } else if (state
                                                is CreatAppointmentFailure) {
                                              return Center(
                                                child: Text(state.errmessag),
                                              );
                                            } else if (state
                                                is CreatAppointmentSuccess) {
                                              return const Center(
                                                child: Text('تمت اضافة الموعد'),
                                              );
                                            }
                                            return Container();
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                  // Navigator.pop(context);
                                }
                              },
                              child: const Text(
                                'اضافة',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            // SignupButton(),
                            SizedBox(height: height * .055),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
              return const Center(
                child: Text('لا يوجد بيانات لعرضها'),
              );
            },
          )),
    );
  }

  Widget customtextformfield(
      {required TextEditingController controller,
      required String hinttext,
      required bool obscureText,
      required String type}) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'الرجاء ادخال هذا الحقل';
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          // Set the outline border
          borderRadius: BorderRadius.circular(15.0), // Set the border radius
        ),
        filled: true,
        fillColor: const Color.fromARGB(255, 242, 231, 215),
        labelText: hinttext,
        labelStyle: const TextStyle(
          color: Colors.black, // تعيين لون الملصق
          fontWeight: FontWeight.bold, // تعيين سماكة الخط
          fontSize: 16.0,
        ),
        contentPadding: const EdgeInsets.only(right: 8.0),
        focusedBorder: OutlineInputBorder(
          // Set the focused border
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: Color(0xffe46b10), // Set the focused border color
            width: 2.0, // Set the focused border width
          ),
        ),
      ),
    );
  }
}
