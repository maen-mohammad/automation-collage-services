part of 'getappointment_cubit.dart';

sealed class GetappointmentState extends Equatable {
  const GetappointmentState();

  @override
  List<Object> get props => [];
}

final class GetappointmentInitial extends GetappointmentState {}

final class GetappointmentLoading extends GetappointmentState {}

final class GetappointmentFailure extends GetappointmentState {
  final String errormsg;

  const GetappointmentFailure(this.errormsg);
}

final class GetappointmentSuccess extends GetappointmentState {
 final MyAppointmentModel myAppointmentModel;

  const GetappointmentSuccess(this.myAppointmentModel);
}
