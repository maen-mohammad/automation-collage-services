import 'package:dartz/dartz.dart';
import 'package:ite/core/failure/failure.dart';
import 'package:ite/features/student%20transactions/data/models/transaction_model/transaction_model.dart';

abstract class Transactionrepo {
  Future<Either<Failure, String>> addtransaction(var body);
  Future<Either<Failure, String>> editetransaction(var body);
  Future<Either<Failure, TransactionModel>> gettransaction();
}
