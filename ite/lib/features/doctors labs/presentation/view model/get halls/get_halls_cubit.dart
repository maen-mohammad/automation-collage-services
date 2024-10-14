import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ite/features/doctors%20labs/data/models/halls_model/halls_model.dart';
import 'package:ite/features/doctors%20labs/data/repos/lab_repo.dart';

part 'get_halls_state.dart';

class GetHallsCubit extends Cubit<GetHallsState> {
  GetHallsCubit(this.labRepo) : super(GetHallsInitial());
  final LabRepo labRepo;
  Future<void> gethalls() async {
    emit(GetHallsLoading());
    var data = await labRepo.gethalls();
    data.fold((failure) {
      emit(GetHallsFailure(failure.errMessage));
    }, (halls) {
      emit(GetHallsSuccess(halls));
    });
  }
}
