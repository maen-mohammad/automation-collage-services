import 'package:equatable/equatable.dart';

class Request extends Equatable {
	final int? id;
	final int? studentId;
	final String? studentName;
	final String? collageNumber;
	final String? photo1;
	final String? photo2;
	final String? photo3;
	final String? photo4;
	final String? photo5;
	final String? state;
	final dynamic descreption;
	final String? type;
	final DateTime? createdAt;
	final DateTime? updatedAt;

	const Request({
		this.id, 
		this.studentId, 
		this.studentName, 
		this.collageNumber, 
		this.photo1, 
		this.photo2, 
		this.photo3, 
		this.photo4, 
		this.photo5, 
		this.state, 
		this.descreption, 
		this.type, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory Request.fromJson(Map<String, dynamic> json) => Request(
				id: json['id'] as int?,
				studentId: json['student_id'] as int?,
				studentName: json['student_name'] as String?,
				collageNumber: json['collage_number'] as String?,
				photo1: json['photo1'] as String?,
				photo2: json['photo2'] as String?,
				photo3: json['photo3'] as String?,
				photo4: json['photo4'] as String?,
				photo5: json['photo5'] as String?,
				state: json['state'] as String?,
				descreption: json['descreption'] as dynamic,
				type: json['type'] as String?,
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'student_id': studentId,
				'student_name': studentName,
				'collage_number': collageNumber,
				'photo1': photo1,
				'photo2': photo2,
				'photo3': photo3,
				'photo4': photo4,
				'photo5': photo5,
				'state': state,
				'descreption': descreption,
				'type': type,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
			};

	@override
	List<Object?> get props {
		return [
				id,
				studentId,
				studentName,
				collageNumber,
				photo1,
				photo2,
				photo3,
				photo4,
				photo5,
				state,
				descreption,
				type,
				createdAt,
				updatedAt,
		];
	}
}
