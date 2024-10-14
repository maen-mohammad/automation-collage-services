import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ite/features/groups/data/models/my_group_model/my_group_model.dart';
import 'package:ite/features/groups/data/repos/group%20repo/group_repo.dart';

part 'get_mygroup_state.dart';

class GetMygroupCubit extends Cubit<GetMygroupState> {
  GetMygroupCubit(this.group) : super(GetMygroupInitial());
  final GroupRepo group;
  Future<void> getgroups() async {
    emit(GetMygroupLoading());
    var result = await group.getgroup();
    result.fold((failure) {
      emit(GetMygroupFailure(failure.errMessage));
    }, (groupsmodel) {
      emit(GetMygroupSuccess(groupsmodel));
    });
  }
}
