import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ite/features/dactors%20schedule/data/repos/doctor_repo.dart';

part 'addnote_state.dart';

class AddnoteCubit extends Cubit<AddnoteState> {
  AddnoteCubit(this.doctorRepo) : super(AddnoteInitial());
   final DoctorRepo doctorRepo;
  Future<void> addnote(var body) async {
    emit(AddnoteLoading());
    var data = await doctorRepo.addnot(body);
    data.fold((failure) {
      emit(AddnoteFailure(failure.errMessage));
    }, (note) {
      emit(AddnoteSuccess(note));
    });
  }
}
