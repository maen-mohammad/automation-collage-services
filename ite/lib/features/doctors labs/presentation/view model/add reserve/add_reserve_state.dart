part of 'add_reserve_cubit.dart';

sealed class AddReserveState extends Equatable {
  const AddReserveState();

  @override
  List<Object> get props => [];
}

final class AddReserveInitial extends AddReserveState {}

final class AddReserveLoading extends AddReserveState {}

final class AddReserveFailure extends AddReserveState {
  final String errormsg;

  AddReserveFailure(this.errormsg);
}

final class AddReserveSuccess extends AddReserveState {
  final String msg;

  AddReserveSuccess(this.msg);
}
