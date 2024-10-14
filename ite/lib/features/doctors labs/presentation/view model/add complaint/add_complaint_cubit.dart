import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ite/features/doctors%20labs/data/repos/lab_repo.dart';

part 'add_complaint_state.dart';

class AddComplaintCubit extends Cubit<AddComplaintState> {
  AddComplaintCubit(this.labRepo) : super(AddComplaintInitial());
  final LabRepo labRepo;
  Future<void> addcomplaint(var body) async {
    emit(AddComplaintLoading());
    var data = await labRepo.addcomplaint(body);
    data.fold((failure) {
      emit(AddComplaintFailure(failure.errMessage));
    }, (msg) {
      emit(AddComplaintSuccess(msg));
    });
  }
}
