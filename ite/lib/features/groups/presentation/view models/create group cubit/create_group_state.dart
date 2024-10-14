part of 'create_group_cubit.dart';

sealed class CreateGroupState extends Equatable {
  const CreateGroupState();

  @override
  List<Object> get props => [];
}

final class CreateGroupInitial extends CreateGroupState {}

final class CreateGroupLoading extends CreateGroupState {}

final class CreateGroupSuccess extends CreateGroupState {
  final CreateGroupModel created;

  const CreateGroupSuccess(this.created);
}

final class CreateGroupFailure extends CreateGroupState {
  final String errmessage;

  const CreateGroupFailure(this.errmessage);
}
