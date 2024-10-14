import 'package:equatable/equatable.dart';

import 'interview.dart';

class CreateAppointment extends Equatable {
	final String? message;
	final Interview? interview;

	const CreateAppointment({this.message, this.interview});

	factory CreateAppointment.fromJson(Map<String, dynamic> json) {
		return CreateAppointment(
			message: json['message'] as String?,
			interview: json['interview'] == null
						? null
						: Interview.fromJson(json['interview'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toJson() => {
				'message': message,
				'interview': interview?.toJson(),
			};

	@override
	List<Object?> get props => [message, interview];
}
