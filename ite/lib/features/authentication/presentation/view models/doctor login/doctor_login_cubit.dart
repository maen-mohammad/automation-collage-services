import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ite/features/authentication/data/models/doctor%20login/doctor_login_model/doctor_login_model.dart';
import 'package:ite/features/authentication/data/models/doctors.dart';
import 'package:ite/features/authentication/data/repos/doctor%20repo/doctor_repo.dart';
import 'package:ite/features/authentication/presentation/view%20models/doctor_auth/doctor_auth_cubit.dart';

part 'doctor_login_state.dart';

class DoctorLoginCubit extends Cubit<DoctorLoginState> {
  DoctorLoginCubit(this.doctor) : super(DoctorLoginInitial());
  final DoctorRepo doctor;
  Future<void> doctorLogin(Doctors doctors) async {
    emit(DoctorLoginLoading());
    var result = await doctor.doctorLogin(doctors);

    result.fold((failure) {
      emit(DoctorLoginFailure(failure.errMessage));
    }, (doctormodel) {
      emit(DoctorLoginSuccess(doctormodel));
    });
  }
}
