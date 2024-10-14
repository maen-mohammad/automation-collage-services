part of 'gettransaction_cubit.dart';

sealed class GettransactionState extends Equatable {
  const GettransactionState();

  @override
  List<Object> get props => [];
}

final class GettransactionInitial extends GettransactionState {}

final class GettransactionLoading extends GettransactionState {}

final class GettransactionFailure extends GettransactionState {
  final String errormsg;

  const GettransactionFailure(this.errormsg);
}

final class GettransactionSuccess extends GettransactionState {
  final TransactionModel transactionModel;

  const GettransactionSuccess(this.transactionModel);
}
