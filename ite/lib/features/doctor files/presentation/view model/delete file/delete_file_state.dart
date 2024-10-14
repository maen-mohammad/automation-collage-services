part of 'delete_file_cubit.dart';

sealed class DeleteFileState extends Equatable {
  const DeleteFileState();

  @override
  List<Object> get props => [];
}

final class DeleteFileInitial extends DeleteFileState {}

final class DeleteFileLoading extends DeleteFileState {}

final class DeleteFileFailure extends DeleteFileState {
  final String errormsg;

  DeleteFileFailure(this.errormsg);
}

final class DeleteFileSuccess extends DeleteFileState {
  final String msg;

  DeleteFileSuccess(this.msg);
}
