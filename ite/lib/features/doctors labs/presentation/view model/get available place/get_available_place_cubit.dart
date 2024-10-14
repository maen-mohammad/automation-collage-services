import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ite/features/doctors%20labs/data/models/available_place/available_place.dart';
import 'package:ite/features/doctors%20labs/data/repos/lab_repo.dart';

part 'get_available_place_state.dart';

class GetAvailablePlaceCubit extends Cubit<GetAvailablePlaceState> {
  GetAvailablePlaceCubit(this.labRepo) : super(GetAvailablePlaceInitial());
  final LabRepo labRepo;
  Future<void> getplace(var body) async {
    emit(GetAvailablePlaceLoading());
    var data = await labRepo.getplace(body);
    data.fold((failure) {
      emit(GetAvailablePlaceFailure(failure.errMessage));
    }, (place) {
      emit(GetAvailablePlaceSuccess(place));
    });
  }
}
