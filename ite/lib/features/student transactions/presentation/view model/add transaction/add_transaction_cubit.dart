import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ite/features/student%20transactions/data/repo/transactionrepo.dart';

part 'add_transaction_state.dart';

class AddTransactionCubit extends Cubit<AddTransactionState> {
  AddTransactionCubit(this.transactionrepo) : super(AddTransactionInitial());
 final Transactionrepo transactionrepo;
  Future<void> addtransaction(var body) async {
    emit(AddTransactionLoading());
    var result =  await transactionrepo.addtransaction(body);
    result.fold((failure) {
      emit(AddTransactionFailure(failure.errMessage));
    }, (msg) {
      emit(AddTransactionSuccess(msg));
    });
  }
}
