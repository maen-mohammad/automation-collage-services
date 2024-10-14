import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ite/core/failure/failure.dart';
import 'package:ite/core/utils/api_service.dart';
import 'package:ite/features/authentication/data/models/doctor%20login/doctor_login_model/doctor_login_model.dart';
import 'package:ite/features/authentication/data/models/doctor%20register/doctor_register_model/doctor_register_model.dart';
import 'package:ite/features/authentication/data/models/doctors.dart';
import 'package:ite/features/authentication/data/models/student_register_model/student_register_model.dart';
import 'package:ite/features/authentication/data/repos/doctor%20repo/doctor_repo.dart';

class DoctorRepoImpl implements DoctorRepo {
  final ApiService apiService;

  DoctorRepoImpl(this.apiService);
  @override
  Future<Either<Failure, DoctorRegisterModel>> doctorRegister(
      Doctors doctors) async {
    try {
      var data = await apiService.get(endurl: 'auth/doctor_register', body: {
        'name': doctors.name,
        'email': doctors.email,
        'password': doctors.password,
        'code': doctors.code,
      });
      DoctorRegisterModel doctor = DoctorRegisterModel.fromJson(data);
      print(doctor);
      return right(doctor);
    } on Exception catch (e) {
      if (e is DioError) {
        print(e.error);
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DoctorLoginModel>> doctorLogin(Doctors doctors) async {
    try {
      var data = await apiService.get(endurl: 'all/login', body: {
        'email': doctors.email,
        'password': doctors.password,
      });
      DoctorLoginModel doctor = DoctorLoginModel.fromJson(data);
      print(doctor);
      return right(doctor);
    } on Exception catch (e) {
      if (e is DioError) {
        print(e.error);
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, StudentRegisterModel>> StudentRegister(
      Doctors doctors) async {
    try {
      var data = await apiService.get(endurl: 'auth/register', body: {
        'name': doctors.name,
        'email': doctors.email,
        'password': doctors.password,
        'collage_number': doctors.code,
      });
      StudentRegisterModel doctor = StudentRegisterModel.fromJson(data);
      print(doctor);
      return right(doctor);
    } on Exception catch (e) {
      if (e is DioError) {
        print(e.error);
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
