part of 'get_myfile_cubit.dart';

sealed class GetMyfileState extends Equatable {
  const GetMyfileState();

  @override
  List<Object> get props => [];
}

final class GetMyfileInitial extends GetMyfileState {}

final class GetMyfileLoading extends GetMyfileState {}

final class GetMyfilefailure extends GetMyfileState {
  final String errormsg;

  GetMyfilefailure(this.errormsg);
}

final class GetMyfileSuccess extends GetMyfileState {
  final MyFileModel myFileModel;

  GetMyfileSuccess(this.myFileModel);
}
