import 'package:equatable/equatable.dart';

class DoctorReserve extends Equatable {
	final int? id;
	final String? place;
	final int? doctorId;
	final String? doctorName;
	final String? from;
	final String? to;
	final String? date;
	final String? reason;
	final String? state;
	final DateTime? createdAt;
	final DateTime? updatedAt;

	const DoctorReserve({
		this.id, 
		this.place, 
		this.doctorId, 
		this.doctorName, 
		this.from, 
		this.to, 
		this.date, 
		this.reason, 
		this.state, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory DoctorReserve.fromJson(Map<String, dynamic> json) => DoctorReserve(
				id: json['id'] as int?,
				place: json['place'] as String?,
				doctorId: json['doctor_id'] as int?,
				doctorName: json['doctor_name'] as String?,
				from: json['from'] as String?,
				to: json['to'] as String?,
				date: json['date'] as String?,
				reason: json['reason'] as String?,
				state: json['state'] as String?,
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'place': place,
				'doctor_id': doctorId,
				'doctor_name': doctorName,
				'from': from,
				'to': to,
				'date': date,
				'reason': reason,
				'state': state,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
			};

	@override
	List<Object?> get props {
		return [
				id,
				place,
				doctorId,
				doctorName,
				from,
				to,
				date,
				reason,
				state,
				createdAt,
				updatedAt,
		];
	}
}
