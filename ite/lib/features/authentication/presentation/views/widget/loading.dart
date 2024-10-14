import 'package:flutter/material.dart';
import 'package:ite/doctor_screen.dart';
import 'package:ite/features/authentication/presentation/view%20models/doctor%20login/doctor_login_cubit.dart';
import 'package:ite/features/authentication/presentation/view%20models/doctor_auth/doctor_auth_cubit.dart';
import 'package:ite/features/authentication/presentation/view%20models/student%20register/student_register_cubit.dart';
import 'package:ite/features/authentication/presentation/views/login_page.dart';
import 'package:ite/features/profiles/presentation/view/user/user_data.dart';
import 'package:ite/student_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Loading extends StatelessWidget {
  Loading({super.key, required this.type});
  final String type;
  var user = UserData.myUser;

  @override
  Widget build(BuildContext context) {
    if (type == 'login') {
      return BlocBuilder<DoctorLoginCubit, DoctorLoginState>(
        builder: (context, state) {
          if (state is DoctorLoginLoading) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is DoctorLoginSuccess) {
            user.token = state.doctor.accessToken!;
            user.name = state.doctor.user!.name!;
            user.email = state.doctor.user!.email!;
            user.aboutMeDescription = state.doctor.user!.specification!;
            user.phone = (state.doctor.user!.phone == null)
                ? '**********09'
                : state.doctor.user!.phone;
            if (state.doctor.userType == 'doctor') {
              return DoctorScreen();
            }
            print(state.doctor.userType);
            return StudentScreen();
          } else if (state is DoctorLoginFailure) {
            return Scaffold(
              body: Center(
                child: Text(state.errmessage),
              ),
            );
          }
          return Container();
        },
      );
    } else if (type == 'ss') {
      return BlocBuilder<StudentRegisterCubit, StudentRegisterState>(
        builder: (context, state) {
          if (state is StudentRegisterLoading) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is StudentRegisterSuccess) {
            print(state.doctor);
            return LoginPage();
            // Navigator.pop(context);
          } else if (state is StudentRegisterFailure) {
            return Scaffold(
              body: Center(
                child: Text(state.errmessage),
              ),
            );
          }
          return Container();
        },
      );
    } else if (type == 'sd') {
      return BlocBuilder<DoctorAuthCubit, DoctorAuthState>(
        builder: (context, state) {
          if (state is DoctorAuthLoading) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is DoctorAuthSuccess) {
            print(state.doctor);
            return LoginPage();
            // Navigator.pop(context);
          } else if (state is DoctorAuthFailure) {
            return Scaffold(
              body: Center(
                child: Text(state.errmessage),
              ),
            );
          }
          return Container();
        },
      );
    }
    return Scaffold(
      body: Text('data'),
    );
  }
}
