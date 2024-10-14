import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ite/features/dactors%20schedule/data/models/my_program/my_program.dart';
import 'package:ite/features/dactors%20schedule/data/repos/doctor_repo.dart';

part 'get_program_state.dart';

class GetProgramCubit extends Cubit<GetProgramState> {
  GetProgramCubit(this.doctorRepo) : super(GetProgramInitial());
  final DoctorRepo doctorRepo;
  Future<void> getprogram() async {
    emit(GetProgramLoading());
    var data = await doctorRepo.getprogram();
    data.fold((failure) {
      emit(GetProgramFailure(failure.errMessage));
    }, (appointment) {
      emit(GetProgramSuccess(appointment));
    });
  }
}
