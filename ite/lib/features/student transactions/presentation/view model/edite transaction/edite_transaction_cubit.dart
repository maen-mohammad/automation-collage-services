import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ite/features/student%20transactions/data/repo/transactionrepo.dart';

part 'edite_transaction_state.dart';

class EditeTransactionCubit extends Cubit<EditeTransactionState> {
  EditeTransactionCubit(this.transactionrepo) : super(EditeTransactionInitial());
   final Transactionrepo transactionrepo;
  Future<void> editetransaction(var body) async {
    emit(EditeTransactionLoading());
    var result =  await transactionrepo.editetransaction(body);
    result.fold((failure) {
      emit(EditeTransactionfailure(failure.errMessage));
    }, (msg) {
      emit(EditeTransactionSuccess(msg));
    });
  }
}
