part of 'controlappointment_cubit.dart';

sealed class ControlappointmentState extends Equatable {
  const ControlappointmentState();

  @override
  List<Object> get props => [];
}

final class ControlappointmentInitial extends ControlappointmentState {}

final class ControlappointmentLoading extends ControlappointmentState {}

final class ControlappointmentFailure extends ControlappointmentState {
  final String errormsg;

  const ControlappointmentFailure(this.errormsg);
}

final class ControlappointmentSuccess extends ControlappointmentState {
  final String msg;

  const ControlappointmentSuccess(this.msg);
}
