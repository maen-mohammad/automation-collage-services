part of 'get_program_cubit.dart';

sealed class GetProgramState extends Equatable {
  const GetProgramState();

  @override
  List<Object> get props => [];
}

final class GetProgramInitial extends GetProgramState {}

final class GetProgramLoading extends GetProgramState {}

final class GetProgramFailure extends GetProgramState {
  final String errormsg;

  GetProgramFailure(this.errormsg);
}

final class GetProgramSuccess extends GetProgramState {
  final MyProgram myProgram;

  GetProgramSuccess(this.myProgram);
}
