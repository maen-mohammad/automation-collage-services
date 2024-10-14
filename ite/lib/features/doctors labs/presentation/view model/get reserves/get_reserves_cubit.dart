import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ite/features/doctors%20labs/data/models/my_reserves/my_reserves.dart';
import 'package:ite/features/doctors%20labs/data/repos/lab_repo.dart';

part 'get_reserves_state.dart';

class GetReservesCubit extends Cubit<GetReservesState> {
  GetReservesCubit(this.labRepo) : super(GetReservesInitial());
  final LabRepo labRepo;
  Future<void> getreserves() async {
    emit(GetReservesLoading());
    var data = await labRepo.getreserves();
    data.fold((failure) {
      emit(GetReservesFailure(failure.errMessage));
    }, (reserves) {
      emit(GetReservesSuccess(reserves));
    });
  }
}
