part of 'getfiles_cubit.dart';

sealed class GetfilesState extends Equatable {
  const GetfilesState();

  @override
  List<Object> get props => [];
}

final class GetfilesInitial extends GetfilesState {}

final class GetfilesLoading extends GetfilesState {}

final class GetfilesFailure extends GetfilesState {
  final String errormsg;

  GetfilesFailure(this.errormsg);
}

final class GetfilesSuccess extends GetfilesState {
  final FilesModel filesModel;

  GetfilesSuccess(this.filesModel);
}
