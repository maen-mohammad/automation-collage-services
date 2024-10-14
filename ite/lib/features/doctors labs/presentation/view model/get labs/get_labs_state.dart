part of 'get_labs_cubit.dart';

sealed class GetLabsState extends Equatable {
  const GetLabsState();

  @override
  List<Object> get props => [];
}

final class GetLabsInitial extends GetLabsState {}

final class GetLabsLoading extends GetLabsState {}

final class GetLabsFailure extends GetLabsState {
  final String errormsg;

  GetLabsFailure(this.errormsg);
}

final class GetLabsSuccess extends GetLabsState {
  final LabsModel labsModel;

  GetLabsSuccess(this.labsModel);
}
