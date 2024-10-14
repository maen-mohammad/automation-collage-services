import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ite/features/student%20transactions/data/models/transaction_model/transaction_model.dart';
import 'package:ite/features/student%20transactions/data/repo/transactionrepo.dart';

part 'gettransaction_state.dart';

class GettransactionCubit extends Cubit<GettransactionState> {
  GettransactionCubit(this.transactionrepo) : super(GettransactionInitial());
   final Transactionrepo transactionrepo;
  Future<void> gettransaction() async {
    emit(GettransactionLoading());
    var result =  await transactionrepo.gettransaction();
    result.fold((failure) {
      emit(GettransactionFailure(failure.errMessage));
    }, (transaction) {
      emit(GettransactionSuccess(transaction));
    });
  }

}
