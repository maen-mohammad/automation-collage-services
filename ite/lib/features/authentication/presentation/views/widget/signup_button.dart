import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ite/features/authentication/presentation/views/sign_up_page.dart';
import 'package:ite/features/student%20schedule/presentation/views/student_appointment.dart';

class SignupButton extends StatefulWidget {
  const SignupButton({super.key});

  @override
  State<SignupButton> createState() => _SignupButtonState();
}

class _SignupButtonState extends State<SignupButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) {
              return SignUpPage();
            },
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade100,
                  offset: Offset(1, 2),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xffe46b10), Color(0xffe46b10)])),
        child: Text(
          'انشاء حساب',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
