import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ite/core/failure/failure.dart';
import 'package:ite/core/utils/api_service.dart';
import 'package:ite/features/doctors%20labs/data/models/available_place/available_place.dart';
import 'package:ite/features/doctors%20labs/data/models/halls_model/halls_model.dart';
import 'package:ite/features/doctors%20labs/data/models/labs_model/labs_model.dart';
import 'package:ite/features/doctors%20labs/data/models/my_reserves/my_reserves.dart';
import 'package:ite/features/doctors%20labs/data/repos/lab_repo.dart';

class LabRepoImpl implements LabRepo {
  final ApiService apiService;

  LabRepoImpl(this.apiService);
  @override
  Future<Either<Failure, HallsModel>> gethalls() async {
    try {
      var data = await apiService.post(endurl: 'doctor/halls', body: null);
      HallsModel halls = HallsModel.fromJson(data);
      return right(halls);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, LabsModel>> gethlabs() async {
    try {
      var data = await apiService.post(endurl: 'doctor/labs', body: null);
      LabsModel labs = LabsModel.fromJson(data);
      return right(labs);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> addcomplaint(body) async {
    try {
      var data =
          await apiService.post(endurl: 'doctor/add_complaint', body: body);
      return right('تمت اضافة الشكوى سيتم التعامل معها بأسرع وقت');
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AvailablePlace>> getplace(body) async {
    try {
      var data =
          await apiService.post(endurl: 'doctor/available_place', body: body);
      AvailablePlace place = AvailablePlace.fromJson(data);
      return right(place);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> addreserve(body) async {
    try {
      var data =
          await apiService.post(endurl: 'doctor/reserve_place', body: body);
      return right('تمت اضافة الحجز بنجاح');
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MyReserves>> getreserves() async {
    try {
      var data =
          await apiService.post(endurl: 'doctor/my_reserves', body: null);
      MyReserves reserves = MyReserves.fromJson(data);
      return right(reserves);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
