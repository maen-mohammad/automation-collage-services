import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ite/features/student%20files/data/models/files_model/files_model.dart';
import 'package:ite/features/student%20files/data/repo/files_repo.dart';

part 'getfiles_state.dart';

class GetfilesCubit extends Cubit<GetfilesState> {
  GetfilesCubit(this.filesRepo) : super(GetfilesInitial());
  final FilesRepo filesRepo;
  Future<void> getfiles(var body) async {
    emit(GetfilesLoading());
    var data = await filesRepo.getfiles(body);
    data.fold((failure) {
      emit(GetfilesFailure(failure.errMessage));
    }, (files) {
      emit(GetfilesSuccess(files));
    });
  }
}
