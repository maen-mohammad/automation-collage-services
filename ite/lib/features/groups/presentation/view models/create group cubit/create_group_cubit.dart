import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ite/features/groups/data/models/create_group_model/create_group_model.dart';
import 'package:ite/features/groups/data/repos/group%20repo/group_repo.dart';

part 'create_group_state.dart';

class CreateGroupCubit extends Cubit<CreateGroupState> {
  CreateGroupCubit(this.group) : super(CreateGroupInitial());
  final GroupRepo group;
  Future<void> creategroups(List student) async {
    emit(CreateGroupLoading());
    var result = await group.creategroup(student);
    result.fold((failure) {
      emit(CreateGroupFailure(failure.errMessage));
    }, (group) {
      emit(CreateGroupSuccess(group));
    });
  }
}
