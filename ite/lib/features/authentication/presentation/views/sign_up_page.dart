import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:ite/features/authentication/data/models/doctors.dart';
import 'package:ite/features/authentication/presentation/view%20models/student%20register/student_register_cubit.dart';
import 'package:ite/features/authentication/presentation/views/sign_up_doctor_page.dart';
import 'package:ite/features/authentication/presentation/views/widget/bezierContainer.dart';
import 'package:ite/features/authentication/presentation/views/widget/loading.dart';
import 'package:ite/features/authentication/presentation/views/widget/title_page.dart';
import 'dart:ui' as ui;

import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordcontroller = TextEditingController();
  final nameController = TextEditingController();
  final numberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Scaffold(
          body: Form(
        key: _formKey,
        child: Container(
          color: Colors.white70,
          height: height,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: -height * .15,
                right: -MediaQuery.of(context).size.width * .4,
                child: BezierContainer(),
              ),
              Positioned(
                top: height * .65,
                right: MediaQuery.of(context).size.width * .4,
                child: BezierContainer(),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: height * .2),
                      TitlePage(),
                      SizedBox(height: 80),
                      customtextformfield(
                          controller: nameController,
                          hinttext: 'الاسم والكنية',
                          obscureText: false,
                          type: 'name'),
                      SizedBox(
                        height: 20,
                      ),
                      customtextformfield(
                          controller: numberController,
                          hinttext: 'الرقم الجامعي',
                          obscureText: false,
                          type: 'number'),
                      SizedBox(
                        height: 20,
                      ),

                      customtextformfield(
                          controller: emailController,
                          hinttext: 'بريدك الالكتروني',
                          obscureText: false,
                          type: 'email'),
                      SizedBox(
                        height: 20,
                      ),
                      customtextformfield(
                          controller: passwordcontroller,
                          hinttext: 'كلمة المرور',
                          obscureText: true,
                          type: 'password'),

                      // EmailPasswordWidget(),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate() &&
                              EmailValidator.validate(emailController.text)) {
                            BlocProvider.of<StudentRegisterCubit>(context)
                                .studentRegister(Doctors(
                              email: emailController.text,
                              password: passwordcontroller.text,
                              code: numberController.text,
                              name: nameController.text,
                            ));
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return Loading(
                                  type: 'ss',
                                );
                              },
                            ));
                          }
                        },
                        child: const Text(
                          ' انشاء الحساب',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'أو',
                        style: TextStyle(fontSize: 16),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffe46b10),
                        ),
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          Navigator.of(context).push(MaterialPageRoute<void>(
                            builder: (context) {
                              return SignUpDoctorPage();
                            },
                          ));
                        },
                        child: const Text(
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          ' انشاء حساب أستاذ',
                        ),
                      ),
                      // SignupButton(),
                      SizedBox(height: height * .055),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
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
        if (type == 'email' && !EmailValidator.validate(emailController.text)) {
          return 'الرجاء ادخال بريد الكتروني صحيح';
        }
        if (type == 'password' && value.length < 8) {
          return 'الرجاء ادخال اكثر من ثمان محارف';
        }
        if (type == 'number' && value.length < 10) {
          return 'الرجاء ادخال رقم من عشر خانات';
        }
        return null;
      },
      keyboardType: (type == 'number')
          ? TextInputType.number
          : TextInputType.emailAddress,
      obscureText: obscureText,
      controller: obscureText
          ? passwordcontroller
          : (type == 'email')
              ? emailController
              : (type == 'name')
                  ? nameController
                  : numberController,
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
