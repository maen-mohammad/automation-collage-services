import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ite/features/student%20schedule/data/models/my_appointment_model/my_appointment_model.dart';
import 'package:ite/features/student%20schedule/data/repos/appointment_repo.dart';

part 'getappointment_state.dart';

class GetappointmentCubit extends Cubit<GetappointmentState> {
  GetappointmentCubit(this.appointmentRepo) : super(GetappointmentInitial());
  final AppointmentRepo appointmentRepo;
  Future<void> getappointment() async {
    emit(GetappointmentLoading());
    var data = await appointmentRepo.getappointment();
    data.fold((failure) {
      emit(GetappointmentFailure(failure.errMessage));
    }, (appointment) {
      emit(GetappointmentSuccess(appointment));
    });
  }
}
