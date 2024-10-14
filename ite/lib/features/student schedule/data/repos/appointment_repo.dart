import 'package:dartz/dartz.dart';
import 'package:ite/core/failure/failure.dart';
import 'package:ite/features/student%20schedule/data/models/create_appointment_model/create_appointment.dart';
import 'package:ite/features/student%20schedule/data/models/doctors/doctors.dart';
import 'package:ite/features/student%20schedule/data/models/my_appointment_model/my_appointment_model.dart';

abstract class AppointmentRepo {
  Future<Either<Failure, CreateAppointment>> createappointment(List details);
  Future<Either<Failure, Doctors>> getdoctor();
  Future<Either<Failure, MyAppointmentModel>> getappointment();
}
