import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ite/core/failure/failure.dart';
import 'package:ite/core/utils/api_service.dart';
import 'package:ite/features/groups/data/models/create_group_model/create_group_model.dart';
import 'package:ite/features/groups/data/models/my_group_model/my_group_model.dart';
import 'package:ite/features/groups/data/repos/group%20repo/group_repo.dart';

class GroupRepoImpl implements GroupRepo {
  final ApiService apiService;

  GroupRepoImpl(this.apiService);

  @override
  Future<Either<Failure, MyGroupModel>> getgroup() async {
    try {
      var data = await apiService.post(endurl: 'user/mygroups', body: {'': ''});
      MyGroupModel groups = MyGroupModel.fromJson(data);
      print(groups);
      return right(groups);
    } on Exception catch (e) {
      if (e is DioError) {
        print(e.error);
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CreateGroupModel>> creategroup(List students) async {
    try {
      var data = await apiService.post(endurl: 'user/create_group', body: {
        "student1": students[0],
        "student2": students[1],
        "student3": students[2],
        "student4": students[3],
        "student5": students[4],
        "student6": students[5],
      });
      CreateGroupModel group = CreateGroupModel.fromJson(data);
      print(group);
      return right(group);
    } on Exception catch (e) {
      if (e is DioError) {
        print(e.error);
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
