import 'package:equatable/equatable.dart';

import 'group.dart';

class CreateGroupModel extends Equatable {
	final String? message;
	final Group? group;

	const CreateGroupModel({this.message, this.group});

	factory CreateGroupModel.fromJson(Map<String, dynamic> json) {
		return CreateGroupModel(
			message: json['message'] as String?,
			group: json['group'] == null
						? null
						: Group.fromJson(json['group'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toJson() => {
				'message': message,
				'group': group?.toJson(),
			};

	@override
	List<Object?> get props => [message, group];
}
