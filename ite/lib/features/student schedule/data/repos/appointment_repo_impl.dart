import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ite/core/failure/failure.dart';
import 'package:ite/core/utils/api_service.dart';
import 'package:ite/features/student%20schedule/data/models/create_appointment_model/create_appointment.dart';
import 'package:ite/features/student%20schedule/data/models/doctors/doctors.dart';
import 'package:ite/features/student%20schedule/data/models/my_appointment_model/my_appointment_model.dart';
import 'package:ite/features/student%20schedule/data/repos/appointment_repo.dart';

class AppointmentRepoImpl implements AppointmentRepo {
  final ApiService apiService;

  AppointmentRepoImpl(this.apiService);

  @override
  Future<Either<Failure, CreateAppointment>> createappointment(
      List details) async {
    try {
      var data = await apiService.post(endurl: 'user/create_interview', body: {
        "group_id": details[0],
        "doctor_id": details[1],
        "goal": details[2],
        "title": details[3],
      });
      CreateAppointment appointment = CreateAppointment.fromJson(data);
      print(appointment);
      return right(appointment);
    } on Exception catch (e) {
      if (e is DioError) {
        print(e.error);
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Doctors>> getdoctor() async {
    try {
      var data = await apiService.post(endurl: 'user/doctors', body: null);
      Doctors doctors = Doctors.fromJson(data);
      return right(doctors);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MyAppointmentModel>> getappointment() async {
    try {
      var data = await apiService.post(endurl: 'user/myinterview', body: null);
      MyAppointmentModel appointments = MyAppointmentModel.fromJson(data);
      return right(appointments);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
