import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ite/features/doctors%20labs/data/repos/lab_repo.dart';

part 'add_reserve_state.dart';

class AddReserveCubit extends Cubit<AddReserveState> {
  AddReserveCubit(this.labRepo) : super(AddReserveInitial());
  final LabRepo labRepo;
  Future<void> addreserve(var body) async {
    emit(AddReserveLoading());
    var data = await labRepo.addreserve(body);
    data.fold((failure) {
      emit(AddReserveFailure(failure.errMessage));
    }, (msg) {
      emit(AddReserveSuccess(msg));
    });
  }
}
