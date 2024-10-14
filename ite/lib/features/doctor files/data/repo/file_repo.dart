import 'package:dartz/dartz.dart';
import 'package:ite/core/failure/failure.dart';
import 'package:ite/features/doctor%20files/data/models/my_file_model/my_file_model.dart';

abstract class FileRepo {
  Future<Either<Failure, MyFileModel>> getmyfile();
  Future<Either<Failure, String>> deletefile(var body);
}
