import 'package:dartz/dartz.dart';
import 'package:ite/core/failure/failure.dart';
import 'package:ite/features/student%20files/data/models/files_model/files_model.dart';

abstract class FilesRepo {
  Future<Either<Failure, FilesModel>> getfiles(var body);
}
