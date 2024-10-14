import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ite/features/dactors%20schedule/data/models/my_appointment/my_appointment.dart';
import 'package:ite/features/dactors%20schedule/data/repos/doctor_repo.dart';

part 'get_my_appointment_state.dart';

class GetMyAppointmentCubit extends Cubit<GetMyAppointmentState> {
  GetMyAppointmentCubit(this.doctorRepo) : super(GetMyAppointmentInitial());
  final DoctorRepo doctorRepo;
  Future<void> getappointment() async {
    emit(GetMyAppointmentloading());
    var data = await doctorRepo.getappointment();
    data.fold((failure) {
      emit(GetMyAppointmentfailure(failure.errMessage));
    }, (appointment) {
      emit(GetMyAppointmentsuccess(appointment));
    });
  }
}
