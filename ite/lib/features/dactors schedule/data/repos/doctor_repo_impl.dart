import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ite/core/failure/failure.dart';
import 'package:ite/core/utils/api_service.dart';
import 'package:ite/features/dactors%20schedule/data/models/my_appointment/my_appointment.dart';
import 'package:ite/features/dactors%20schedule/data/models/my_program/my_program.dart';
import 'package:ite/features/dactors%20schedule/data/models/notes_model/notes_model.dart';
import 'package:ite/features/dactors%20schedule/data/repos/doctor_repo.dart';

class DoctorRepoImpl1 implements DoctorRepo {
  final ApiService apiService;

  DoctorRepoImpl1(this.apiService);

  @override
  Future<Either<Failure, MyAppointment>> getappointment() async {
    try {
      var data =
          await apiService.post(endurl: 'doctor/myinterview', body: null);
      MyAppointment appointments = MyAppointment.fromJson(data);
      return right(appointments);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MyProgram>> getprogram() async {
    try {
      var data = await apiService.post(endurl: 'doctor/my_program', body: null);
      MyProgram program = MyProgram.fromJson(data);
      return right(program);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> addnot(var body) async {
    try {
       await apiService.post(endurl: 'doctor/add_note', body: body);

      return right('تمت الاضافة بنجاح');
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, NotesModel>> getnotes(body) async {
    try {
      var data = await apiService.post(endurl: 'doctor/notes', body: body);
      NotesModel notesModel = NotesModel.fromJson(data);
      return right(notesModel);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, String>> controlappointment(body) async {
    try {
      await apiService.post(endurl: 'doctor/control_interview', body: body);

      return right('تمت العملية بنجاح');
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, String>> controlallappointment(body) async {
    try {
      await apiService.post(endurl: 'doctor/control_all_interview', body: body);

      return right('تمت العملية بنجاح');
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
