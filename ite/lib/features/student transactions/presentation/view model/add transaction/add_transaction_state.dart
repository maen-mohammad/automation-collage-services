part of 'add_transaction_cubit.dart';

sealed class AddTransactionState extends Equatable {
  const AddTransactionState();

  @override
  List<Object> get props => [];
}

final class AddTransactionInitial extends AddTransactionState {}

final class AddTransactionLoading extends AddTransactionState {}

final class AddTransactionFailure extends AddTransactionState {
  final String errormsg;

  const AddTransactionFailure(this.errormsg);
}

final class AddTransactionSuccess extends AddTransactionState {
  final String msg;

  AddTransactionSuccess(this.msg);
}
