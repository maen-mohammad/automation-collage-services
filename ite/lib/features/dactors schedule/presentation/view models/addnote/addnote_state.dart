part of 'addnote_cubit.dart';

sealed class AddnoteState extends Equatable {
  const AddnoteState();

  @override
  List<Object> get props => [];
}

final class AddnoteInitial extends AddnoteState {}

final class AddnoteLoading extends AddnoteState {}

final class AddnoteSuccess extends AddnoteState {
  final String msg;

 const AddnoteSuccess(this.msg);
}

final class AddnoteFailure extends AddnoteState {
  final String errormsg;

 const AddnoteFailure(this.errormsg);
}
