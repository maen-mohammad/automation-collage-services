part of 'creat_appointment_cubit.dart';

sealed class CreatAppointmentState extends Equatable {
  const CreatAppointmentState();

  @override
  List<Object> get props => [];
}

final class CreatAppointmentInitial extends CreatAppointmentState {}

final class CreatAppointmentLoading extends CreatAppointmentState {}

final class CreatAppointmentSuccess extends CreatAppointmentState {
  final CreateAppointment Appointment;

  const CreatAppointmentSuccess(this.Appointment);
}

final class CreatAppointmentFailure extends CreatAppointmentState {
  final String errmessag;

  const CreatAppointmentFailure(this.errmessag);
}
