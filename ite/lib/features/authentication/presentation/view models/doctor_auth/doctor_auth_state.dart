part of 'doctor_auth_cubit.dart';

sealed class DoctorAuthState extends Equatable {
  const DoctorAuthState();

  @override
  List<Object> get props => [];
}

final class DoctorAuthInitial extends DoctorAuthState {}

final class DoctorAuthLoading extends DoctorAuthState {}

final class DoctorAuthFailure extends DoctorAuthState {
  final String errmessage;

  const DoctorAuthFailure(this.errmessage);
}

final class DoctorAuthSuccess extends DoctorAuthState {
  final DoctorRegisterModel doctor;

 const DoctorAuthSuccess(this.doctor);
}
