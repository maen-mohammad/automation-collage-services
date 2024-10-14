import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ite/features/doctor%20files/data/models/my_file_model/my_file_model.dart';
import 'package:ite/features/doctor%20files/data/repo/file_repo.dart';

part 'get_myfile_state.dart';

class GetMyfileCubit extends Cubit<GetMyfileState> {
  GetMyfileCubit(this.fileRepo) : super(GetMyfileInitial());
  final FileRepo fileRepo;
  Future<void> getfile() async {
    emit(GetMyfileLoading());
    var data = await fileRepo.getmyfile();
    data.fold((failure) {
      emit(GetMyfilefailure(failure.errMessage));
    }, (files) {
      emit(GetMyfileSuccess(files));
    });
  }
}
