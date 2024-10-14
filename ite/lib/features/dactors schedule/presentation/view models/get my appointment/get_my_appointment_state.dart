part of 'get_my_appointment_cubit.dart';

sealed class GetMyAppointmentState extends Equatable {
  const GetMyAppointmentState();

  @override
  List<Object> get props => [];
}

final class GetMyAppointmentInitial extends GetMyAppointmentState {}

final class GetMyAppointmentloading extends GetMyAppointmentState {}

final class GetMyAppointmentfailure extends GetMyAppointmentState {
  final String errormsg;

  GetMyAppointmentfailure(this.errormsg);
}

final class GetMyAppointmentsuccess extends GetMyAppointmentState {
  final MyAppointment myAppointment;

  GetMyAppointmentsuccess(this.myAppointment);
}
