import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ite/features/authentication/data/models/doctors.dart';
import 'package:ite/features/authentication/data/models/student_register_model/student_register_model.dart';
import 'package:ite/features/authentication/data/repos/doctor%20repo/doctor_repo.dart';

part 'student_register_state.dart';

class StudentRegisterCubit extends Cubit<StudentRegisterState> {
  StudentRegisterCubit(this.doctor) : super(StudentRegisterInitial());
  final DoctorRepo doctor;
  Future<void> studentRegister(Doctors doctors) async {
    emit(StudentRegisterLoading());
    var result = await doctor.StudentRegister(doctors);
    result.fold((failure) {
      emit(StudentRegisterFailure(failure.errMessage));
    }, (doctormodel) {
      emit(StudentRegisterSuccess(doctormodel));
    });
  }
}
