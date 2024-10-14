part of 'getnotes_cubit.dart';

sealed class GetnotesState extends Equatable {
  const GetnotesState();

  @override
  List<Object> get props => [];
}

final class GetnotesInitial extends GetnotesState {}

final class GetnotesLoading extends GetnotesState {}

final class GetnotesFailure extends GetnotesState {
  final String errormsg;

const  GetnotesFailure(this.errormsg);
}

final class GetnotesSuccess extends GetnotesState {
  final NotesModel notesModel;

const  GetnotesSuccess(this.notesModel);
}
