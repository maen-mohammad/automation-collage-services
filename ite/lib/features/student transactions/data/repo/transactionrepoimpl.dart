import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ite/core/failure/failure.dart';
import 'package:ite/core/utils/api_service.dart';
import 'package:ite/features/student%20transactions/data/models/transaction_model/transaction_model.dart';
import 'package:ite/features/student%20transactions/data/repo/transactionrepo.dart';

class Transactionrepoimpl implements Transactionrepo {
  final ApiService apiService;

  Transactionrepoimpl(this.apiService);

  @override
  Future<Either<Failure, String>> addtransaction(body) async {
    try {
      await apiService.post1(endurl: 'user/create_request', body: body);
      return right('تمت العملية بنجاح');
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TransactionModel>> gettransaction() async {
    try {
      var data = await apiService.post(endurl: 'user/my_request', body: null);
      TransactionModel transactionModel = TransactionModel.fromJson(data);
      return right(transactionModel);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, String>> editetransaction(body)async {
    try {
      await apiService.post1(endurl: 'user/update_request', body: body);
      return right('تمت العملية بنجاح');
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
