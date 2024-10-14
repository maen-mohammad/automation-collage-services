import 'package:dartz/dartz.dart';
import 'package:ite/core/failure/failure.dart';
import 'package:ite/features/authentication/data/models/doctor%20login/doctor_login_model/doctor_login_model.dart';
import 'package:ite/features/authentication/data/models/doctor%20register/doctor_register_model/doctor_register_model.dart';
import 'package:ite/features/authentication/data/models/doctors.dart';
import 'package:ite/features/authentication/data/models/student_register_model/student_register_model.dart';

abstract class DoctorRepo{
  Future<Either<Failure,DoctorRegisterModel>> doctorRegister(Doctors doctors); 
    Future<Either<Failure,StudentRegisterModel>> StudentRegister(Doctors doctors); 

    Future<Either<Failure,DoctorLoginModel>> doctorLogin(Doctors doctors); 

}