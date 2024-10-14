import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ite/features/dactors%20schedule/data/repos/doctor_repo.dart';

part 'controlallappointment_state.dart';

class ControlallappointmentCubit extends Cubit<ControlallappointmentState> {
  ControlallappointmentCubit(this.doctorRepo)
      : super(ControlallappointmentInitial());
  final DoctorRepo doctorRepo;
  Future<void> controlappointment(var body) async {
    emit(ControlallappointmentLoading());
    var data = await doctorRepo.controlallappointment(body);
    data.fold((failure) {
      emit(ControlallappointmentFailutr(failure.errMessage));
    }, (msg) {
      emit(ControlallappointmentSuccess(msg));
    });
  }
}
