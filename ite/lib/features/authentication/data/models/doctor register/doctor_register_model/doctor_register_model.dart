import 'package:equatable/equatable.dart';

import 'doctor.dart';

class DoctorRegisterModel extends Equatable {
	final String? message;
	final Doctor? doctor;

	const DoctorRegisterModel({this.message, this.doctor});

	factory DoctorRegisterModel.fromJson(Map<String, dynamic> json) {
		return DoctorRegisterModel(
			message: json['message'] as String?,
			doctor: json['doctor'] == null
						? null
						: Doctor.fromJson(json['doctor'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toJson() => {
				'message': message,
				'doctor': doctor?.toJson(),
			};

	@override
	List<Object?> get props => [message, doctor];
}
