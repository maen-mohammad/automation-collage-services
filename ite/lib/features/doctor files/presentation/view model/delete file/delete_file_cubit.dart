import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ite/features/doctor%20files/data/repo/file_repo.dart';

part 'delete_file_state.dart';

class DeleteFileCubit extends Cubit<DeleteFileState> {
  DeleteFileCubit(this.fileRepo) : super(DeleteFileInitial());
  
  final FileRepo fileRepo;
  Future<void> deletefile(var body) async {
    emit(DeleteFileLoading());
    var data = await fileRepo.deletefile(body);
    data.fold((failure) {
      emit(DeleteFileFailure(failure.errMessage));
    }, (msg) {
      emit(DeleteFileSuccess(msg));
    });
  }
}
