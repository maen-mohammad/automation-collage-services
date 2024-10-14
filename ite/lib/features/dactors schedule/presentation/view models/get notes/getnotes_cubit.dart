import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ite/features/dactors%20schedule/data/models/notes_model/notes_model.dart';
import 'package:ite/features/dactors%20schedule/data/repos/doctor_repo.dart';

part 'getnotes_state.dart';

class GetnotesCubit extends Cubit<GetnotesState> {
  GetnotesCubit(this.doctorRepo) : super(GetnotesInitial());
   final DoctorRepo doctorRepo;
  Future<void> getnotes(var body) async {
    emit(GetnotesLoading());
    var data = await doctorRepo.getnotes(body);
    data.fold((failure) {
      emit(GetnotesFailure(failure.errMessage));
    }, (notes) {
      emit(GetnotesSuccess(notes));
    });
  }
}
