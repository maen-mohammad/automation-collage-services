import 'package:dartz/dartz.dart';
import 'package:ite/core/failure/failure.dart';
import 'package:ite/features/groups/data/models/create_group_model/create_group_model.dart';
import 'package:ite/features/groups/data/models/my_group_model/my_group_model.dart';

abstract class GroupRepo {
  Future<Either<Failure, MyGroupModel>> getgroup();
  Future<Either<Failure, CreateGroupModel>> creategroup(List students);
}
