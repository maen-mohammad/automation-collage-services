import 'package:equatable/equatable.dart';

import 'doctor_interview.dart';

class MyAppointment extends Equatable {
	final List<DoctorInterview>? doctorInterview;

	const MyAppointment({this.doctorInterview});

	factory MyAppointment.fromJson(Map<String, dynamic> json) => MyAppointment(
				doctorInterview: (json['doctor_interview'] as List<dynamic>?)
						?.map((e) => DoctorInterview.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'doctor_interview': doctorInterview?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props => [doctorInterview];
}
