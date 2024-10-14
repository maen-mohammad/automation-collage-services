import 'package:equatable/equatable.dart';

import 'group.dart';

class MyGroupModel extends Equatable {
	final List<Group>? groups;

	const MyGroupModel({this.groups});

	factory MyGroupModel.fromJson(Map<String, dynamic> json) => MyGroupModel(
				groups: (json['groups'] as List<dynamic>?)
						?.map((e) => Group.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'groups': groups?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props => [groups];
}
