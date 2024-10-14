part of 'getdoctors_cubit.dart';

sealed class GetdoctorsState extends Equatable {
  const GetdoctorsState();

  @override
  List<Object> get props => [];
}

final class GetdoctorsInitial extends GetdoctorsState {}

final class GetdoctorsLoading extends GetdoctorsState {}

final class GetdoctorsFailure extends GetdoctorsState {
  final String errormsg;

  GetdoctorsFailure(this.errormsg);
}

final class GetdoctorsSuccess extends GetdoctorsState {
 final Doctors doctors;

  GetdoctorsSuccess(this.doctors);
}
