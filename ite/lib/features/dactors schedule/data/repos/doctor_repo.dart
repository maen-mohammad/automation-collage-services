import 'package:dartz/dartz.dart';
import 'package:ite/core/failure/failure.dart';
import 'package:ite/features/dactors%20schedule/data/models/my_appointment/my_appointment.dart';
import 'package:ite/features/dactors%20schedule/data/models/my_program/my_program.dart';
import 'package:ite/features/dactors%20schedule/data/models/notes_model/notes_model.dart';

abstract class DoctorRepo {
  Future<Either<Failure, MyAppointment>> getappointment();
  Future<Either<Failure, MyProgram>> getprogram();
  Future<Either<Failure, String>> addnot(var body);
  Future<Either<Failure, NotesModel>> getnotes(var body);
  Future<Either<Failure, String>> controlappointment(var body);
  Future<Either<Failure, String>> controlallappointment(var body);
}
