part of 'get_mygroup_cubit.dart';

sealed class GetMygroupState extends Equatable {
  const GetMygroupState();

  @override
  List<Object> get props => [];
}

final class GetMygroupInitial extends GetMygroupState {}

final class GetMygroupLoading extends GetMygroupState {}

final class GetMygroupSuccess extends GetMygroupState {
  final MyGroupModel groups;

  GetMygroupSuccess(this.groups);
}

final class GetMygroupFailure extends GetMygroupState {
  final String errmessage;

  GetMygroupFailure(this.errmessage);
}
