import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ite/features/student%20schedule/data/models/doctors/doctors.dart';
import 'package:ite/features/student%20schedule/data/repos/appointment_repo.dart';

part 'getdoctors_state.dart';

class GetdoctorsCubit extends Cubit<GetdoctorsState> {
  GetdoctorsCubit(this.appointmentRepo) : super(GetdoctorsInitial());
  final AppointmentRepo appointmentRepo;
  Future<void> getdoctors() async {
    emit(GetdoctorsLoading());
    var data = await appointmentRepo.getdoctor();
    data.fold((failure) {
      emit(GetdoctorsFailure(failure.errMessage));
    }, (doctors) {
      emit(GetdoctorsSuccess(doctors));
    });
  }
}
