import 'package:equatable/equatable.dart';

class Group extends Equatable {
	final String? student1;
	final String? student2;
	final String? student3;
	final String? student4;
	final String? student5;
	final String? student6;
	final String? type;
	final int? studentId;
	final DateTime? updatedAt;
	final DateTime? createdAt;
	final int? id;

	const Group({
		this.student1, 
		this.student2, 
		this.student3, 
		this.student4, 
		this.student5, 
		this.student6, 
		this.type, 
		this.studentId, 
		this.updatedAt, 
		this.createdAt, 
		this.id, 
	});

	factory Group.fromJson(Map<String, dynamic> json) => Group(
				student1: json['student1'] as String?,
				student2: json['student2'] as String?,
				student3: json['student3'] as String?,
				student4: json['student4'] as String?,
				student5: json['student5'] as String?,
				student6: json['student6'] as String?,
				type: json['type'] as String?,
				studentId: json['student_id'] as int?,
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				id: json['id'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'student1': student1,
				'student2': student2,
				'student3': student3,
				'student4': student4,
				'student5': student5,
				'student6': student6,
				'type': type,
				'student_id': studentId,
				'updated_at': updatedAt?.toIso8601String(),
				'created_at': createdAt?.toIso8601String(),
				'id': id,
			};

	@override
	List<Object?> get props {
		return [
				student1,
				student2,
				student3,
				student4,
				student5,
				student6,
				type,
				studentId,
				updatedAt,
				createdAt,
				id,
		];
	}
}
