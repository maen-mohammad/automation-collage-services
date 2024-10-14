import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ite/core/failure/failure.dart';
import 'package:ite/core/utils/api_service.dart';
import 'package:ite/features/student%20files/data/models/files_model/files_model.dart';
import 'package:ite/features/student%20files/data/repo/files_repo.dart';

class FileRepoImpl implements FilesRepo {
  final ApiService apiService;

  FileRepoImpl(this.apiService);

  @override
  Future<Either<Failure, FilesModel>> getfiles(body) async {
    try {
      var data = await apiService.post(endurl: 'user/doctor_files', body: body);
      FilesModel files = FilesModel.fromJson(data);
      return right(files);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
