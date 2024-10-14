import 'package:equatable/equatable.dart';

import 'doctor_reserve.dart';

class MyReserves extends Equatable {
	final List<DoctorReserve>? doctorReserve;

	const MyReserves({this.doctorReserve});

	factory MyReserves.fromJson(Map<String, dynamic> json) => MyReserves(
				doctorReserve: (json['doctor_reserve'] as List<dynamic>?)
						?.map((e) => DoctorReserve.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'doctor_reserve': doctorReserve?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props => [doctorReserve];
}
