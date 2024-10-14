import 'package:equatable/equatable.dart';

class DoctorFile extends Equatable {
	final int? id;
	final int? doctorId;
	final String? name;
	final String? file;
	final DateTime? createdAt;
	final DateTime? updatedAt;

	const DoctorFile({
		this.id, 
		this.doctorId, 
		this.name, 
		this.file, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory DoctorFile.fromJson(Map<String, dynamic> json) => DoctorFile(
				id: json['id'] as int?,
				doctorId: json['doctor_id'] as int?,
				name: json['name'] as String?,
				file: json['file'] as String?,
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'doctor_id': doctorId,
				'name': name,
				'file': file,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
			};

	@override
	List<Object?> get props {
		return [
				id,
				doctorId,
				name,
				file,
				createdAt,
				updatedAt,
		];
	}
}
