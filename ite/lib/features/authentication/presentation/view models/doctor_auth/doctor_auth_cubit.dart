import 'package:ite/features/authentication/data/models/doctors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:ite/features/authentication/data/models/doctor%20register/doctor_register_model/doctor_register_model.dart';
import 'package:ite/features/authentication/data/repos/doctor%20repo/doctor_repo.dart';

part 'doctor_auth_state.dart';

class DoctorAuthCubit extends Cubit<DoctorAuthState> {
  DoctorAuthCubit(this.doctor) : super(DoctorAuthInitial());
  final DoctorRepo doctor;
  Future<void> doctorRegister(Doctors doctors) async {
    emit(DoctorAuthLoading());
    var result = await doctor.doctorRegister(doctors);
    result.fold((failure) {
      emit(DoctorAuthFailure(failure.errMessage));
    }, (doctormodel) {
      emit(DoctorAuthSuccess(doctormodel));
    });
  }
}
