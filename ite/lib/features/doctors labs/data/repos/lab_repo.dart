import 'package:dartz/dartz.dart';
import 'package:ite/core/failure/failure.dart';
import 'package:ite/features/doctors%20labs/data/models/available_place/available_place.dart';
import 'package:ite/features/doctors%20labs/data/models/halls_model/halls_model.dart';
import 'package:ite/features/doctors%20labs/data/models/labs_model/labs_model.dart';
import 'package:ite/features/doctors%20labs/data/models/my_reserves/my_reserves.dart';

abstract class LabRepo {
  Future<Either<Failure, HallsModel>> gethalls();
  Future<Either<Failure, LabsModel>> gethlabs();
  Future<Either<Failure, String>> addcomplaint(var body);
  Future<Either<Failure, AvailablePlace>> getplace(var body);
  Future<Either<Failure, String>> addreserve(var body);
  Future<Either<Failure, MyReserves>> getreserves();
}
