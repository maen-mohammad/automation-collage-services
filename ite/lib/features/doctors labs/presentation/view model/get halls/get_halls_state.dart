part of 'get_halls_cubit.dart';

sealed class GetHallsState extends Equatable {
  const GetHallsState();

  @override
  List<Object> get props => [];
}

final class GetHallsInitial extends GetHallsState {}

final class GetHallsLoading extends GetHallsState {}

final class GetHallsFailure extends GetHallsState {
  final String errormsg;

  GetHallsFailure(this.errormsg);
}

final class GetHallsSuccess extends GetHallsState {
  final HallsModel hallsModel;

  GetHallsSuccess(this.hallsModel);
}
