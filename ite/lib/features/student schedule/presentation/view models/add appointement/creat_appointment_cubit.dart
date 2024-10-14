import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ite/features/student%20schedule/data/models/create_appointment_model/create_appointment.dart';
import 'package:ite/features/student%20schedule/data/repos/appointment_repo.dart';

part 'creat_appointment_state.dart';

class CreatAppointmentCubit extends Cubit<CreatAppointmentState> {
  CreatAppointmentCubit(this.appointmentRepo)
      : super(CreatAppointmentInitial());
  final AppointmentRepo appointmentRepo;
  Future<void> createappointment(List details) async {
    emit(CreatAppointmentLoading());
    var result = await appointmentRepo.createappointment(details);
    result.fold((failure) {
      emit(CreatAppointmentFailure(failure.errMessage));
    }, (appointment) {
      emit(CreatAppointmentSuccess(appointment));
    });
  }
}
