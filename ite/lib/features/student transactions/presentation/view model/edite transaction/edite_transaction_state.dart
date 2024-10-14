part of 'edite_transaction_cubit.dart';

sealed class EditeTransactionState extends Equatable {
  const EditeTransactionState();

  @override
  List<Object> get props => [];
}

final class EditeTransactionInitial extends EditeTransactionState {}

final class EditeTransactionLoading extends EditeTransactionState {}

final class EditeTransactionfailure extends EditeTransactionState {
  final String errormsg;

  const EditeTransactionfailure(this.errormsg);
}

final class EditeTransactionSuccess extends EditeTransactionState {
  final String msg;

  const EditeTransactionSuccess(this.msg);
}
