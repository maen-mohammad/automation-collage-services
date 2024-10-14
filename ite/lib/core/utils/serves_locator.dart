import 'package:dio/dio.dart';
import 'package:ite/core/utils/api_service.dart';
import 'package:ite/features/authentication/data/repos/doctor%20repo/doctor_repo_impl.dart';
import 'package:ite/features/dactors%20schedule/data/repos/doctor_repo_impl.dart';
import 'package:ite/features/doctors%20labs/data/repos/lab_repo_impl.dart';
import 'package:ite/features/groups/data/repos/group%20repo/group_repo_impl.dart';
import 'package:ite/features/student%20files/data/repo/file_repo_impl.dart';
import 'package:ite/features/student%20schedule/data/repos/appointment_repo_impl.dart';
import 'package:ite/features/doctor%20files/data/repo/file_repo_impl.dart' as dfile;

import 'package:get_it/get_it.dart';
import 'package:ite/features/student%20transactions/data/repo/transactionrepoimpl.dart';

final getit = GetIt.instance;
void setup() {
  getit.registerSingleton<ApiService>(ApiService(Dio()));
  getit.registerSingleton<DoctorRepoImpl>(
      DoctorRepoImpl(getit.get<ApiService>()));
  getit
      .registerSingleton<GroupRepoImpl>(GroupRepoImpl(getit.get<ApiService>()));
  getit.registerSingleton<AppointmentRepoImpl>(
      AppointmentRepoImpl(getit.get<ApiService>()));
  getit.registerSingleton<FileRepoImpl>(FileRepoImpl(getit.get<ApiService>()));
  getit.registerSingleton<DoctorRepoImpl1>(
      DoctorRepoImpl1(getit.get<ApiService>()));
  getit.registerSingleton<LabRepoImpl>(LabRepoImpl(getit.get<ApiService>()));
  getit.registerSingleton<dfile.FileRepoImpl>(dfile.FileRepoImpl(getit.get<ApiService>()));
  getit.registerSingleton<Transactionrepoimpl>(Transactionrepoimpl(getit.get<ApiService>()));
}
