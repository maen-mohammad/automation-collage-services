import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ite/core/failure/failure.dart';
import 'package:ite/core/utils/api_service.dart';
import 'package:ite/features/doctor%20files/data/models/my_file_model/my_file_model.dart';
import 'package:ite/features/doctor%20files/data/repo/file_repo.dart';

class FileRepoImpl implements FileRepo {
  final ApiService apiService;

  FileRepoImpl(this.apiService);
  @override
  Future<Either<Failure, MyFileModel>> getmyfile() async {
    try {
      var data = await apiService.post(endurl: 'doctor/my_files', body: null);
      MyFileModel appointments = MyFileModel.fromJson(data);
      return right(appointments);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deletefile(var body) async {
    try {
      await apiService.post(endurl: 'doctor/delete_file', body: body);
      return right('تم حذف الملف بنجاح');
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
