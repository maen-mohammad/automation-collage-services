part of 'get_available_place_cubit.dart';

sealed class GetAvailablePlaceState extends Equatable {
  const GetAvailablePlaceState();

  @override
  List<Object> get props => [];
}

final class GetAvailablePlaceInitial extends GetAvailablePlaceState {}

final class GetAvailablePlaceLoading extends GetAvailablePlaceState {}

final class GetAvailablePlaceFailure extends GetAvailablePlaceState {
  final String errormsg;

  GetAvailablePlaceFailure(this.errormsg);
}

final class GetAvailablePlaceSuccess extends GetAvailablePlaceState {
  final AvailablePlace availablePlace;

  GetAvailablePlaceSuccess(this.availablePlace);
}
