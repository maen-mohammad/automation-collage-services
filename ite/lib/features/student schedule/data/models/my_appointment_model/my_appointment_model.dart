import 'package:equatable/equatable.dart';

import 'user_interview.dart';

class MyAppointmentModel extends Equatable {
	final List<UserInterview>? userInterview;

	const MyAppointmentModel({this.userInterview});

	factory MyAppointmentModel.fromJson(Map<String, dynamic> json) {
		return MyAppointmentModel(
			userInterview: (json['user_interview'] as List<dynamic>?)
						?.map((e) => UserInterview.fromJson(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toJson() => {
				'user_interview': userInterview?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props => [userInterview];
}
