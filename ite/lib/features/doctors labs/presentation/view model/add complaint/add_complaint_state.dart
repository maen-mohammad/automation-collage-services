part of 'add_complaint_cubit.dart';

sealed class AddComplaintState extends Equatable {
  const AddComplaintState();

  @override
  List<Object> get props => [];
}

final class AddComplaintInitial extends AddComplaintState {}

final class AddComplaintLoading extends AddComplaintState {}

final class AddComplaintFailure extends AddComplaintState {
  final String errormsg;

  AddComplaintFailure(this.errormsg);
}

final class AddComplaintSuccess extends AddComplaintState {
  final String msg;

  AddComplaintSuccess(this.msg);
}
