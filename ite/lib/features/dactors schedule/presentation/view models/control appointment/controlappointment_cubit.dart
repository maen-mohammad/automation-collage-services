import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ite/features/dactors%20schedule/data/repos/doctor_repo.dart';

part 'controlappointment_state.dart';

class ControlappointmentCubit extends Cubit<ControlappointmentState> {
  ControlappointmentCubit(this.doctorRepo) : super(ControlappointmentInitial());
   final DoctorRepo doctorRepo;
  Future<void> controlappointment(var body) async {
    emit(ControlappointmentLoading());
    var data = await doctorRepo.controlappointment(body);
    data.fold((failure) {
      emit(ControlappointmentFailure(failure.errMessage));
    }, (note) {
      emit(ControlappointmentSuccess(note));
    });
  }
}
