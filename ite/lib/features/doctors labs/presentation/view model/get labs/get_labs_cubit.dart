import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ite/features/doctors%20labs/data/models/labs_model/labs_model.dart';
import 'package:ite/features/doctors%20labs/data/repos/lab_repo.dart';

part 'get_labs_state.dart';

class GetLabsCubit extends Cubit<GetLabsState> {
  GetLabsCubit(this.labRepo) : super(GetLabsInitial());
  final LabRepo labRepo;
  Future<void> getlabs() async {
    emit(GetLabsLoading());
    var data = await labRepo.gethlabs();
    data.fold((failure) {
      emit(GetLabsFailure(failure.errMessage));
    }, (labs) {
      emit(GetLabsSuccess(labs));
    });
  }
}
