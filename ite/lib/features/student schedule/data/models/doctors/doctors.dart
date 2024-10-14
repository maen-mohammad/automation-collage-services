import 'package:equatable/equatable.dart';

import 'doctor.dart';

class Doctors extends Equatable {
	final List<Doctor>? doctors;

	const Doctors({this.doctors});

	factory Doctors.fromJson(Map<String, dynamic> json) => Doctors(
				doctors: (json['doctors'] as List<dynamic>?)
						?.map((e) => Doctor.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'doctors': doctors?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props => [doctors];
}
