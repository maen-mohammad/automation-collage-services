part of 'controlallappointment_cubit.dart';

sealed class ControlallappointmentState extends Equatable {
  const ControlallappointmentState();

  @override
  List<Object> get props => [];
}

final class ControlallappointmentInitial extends ControlallappointmentState {}

final class ControlallappointmentLoading extends ControlallappointmentState {}

final class ControlallappointmentFailutr extends ControlallappointmentState {
  final String errormsg;

  const ControlallappointmentFailutr(this.errormsg);
}

final class ControlallappointmentSuccess extends ControlallappointmentState {
  final String msg;

  const ControlallappointmentSuccess(this.msg);
}
