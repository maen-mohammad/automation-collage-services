part of 'doctor_login_cubit.dart';

sealed class DoctorLoginState extends Equatable {
  const DoctorLoginState();

  @override
  List<Object> get props => [];
}

final class DoctorLoginInitial extends DoctorLoginState {}

final class DoctorLoginSuccess extends DoctorLoginState {
   final DoctorLoginModel doctor;

 const DoctorLoginSuccess(this.doctor);
}

final class DoctorLoginFailure extends DoctorLoginState {
  final String errmessage;

  const DoctorLoginFailure(this.errmessage);
}

final class DoctorLoginLoading extends DoctorLoginState {}
