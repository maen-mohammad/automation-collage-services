part of 'get_reserves_cubit.dart';

sealed class GetReservesState extends Equatable {
  const GetReservesState();

  @override
  List<Object> get props => [];
}

final class GetReservesInitial extends GetReservesState {}

final class GetReservesLoading extends GetReservesState {}

final class GetReservesFailure extends GetReservesState {
  final String errormsg;

  GetReservesFailure(this.errormsg);
}

final class GetReservesSuccess extends GetReservesState {
  final MyReserves myReserves;

  GetReservesSuccess(this.myReserves);
}
