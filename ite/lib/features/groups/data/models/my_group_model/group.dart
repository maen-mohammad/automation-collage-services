import 'package:equatable/equatable.dart';

class Group extends Equatable {
	final int? id;
	final int? studentId;
	final String? student1;
	final String? student2;
	final String? student3;
	final String? student4;
	final String? student5;
	final String? student6;
	final String? type;
	final DateTime? createdAt;
	final DateTime? updatedAt;

	const Group({
		this.id, 
		this.studentId, 
		this.student1, 
		this.student2, 
		this.student3, 
		this.student4, 
		this.student5, 
		this.student6, 
		this.type, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory Group.fromJson(Map<String, dynamic> json) => Group(
				id: json['id'] as int?,
				studentId: json['student_id'] as int?,
				student1: json['student1'] as String?,
				student2: json['student2'] as String?,
				student3: json['student3'] as String?,
				student4: json['student4'] as String?,
				student5: json['student5'] as String?,
				student6: json['student6'] as String?,
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
				'student1': student1,
				'student2': student2,
				'student3': student3,
				'student4': student4,
				'student5': student5,
				'student6': student6,
				'type': type,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
			};

	@override
	List<Object?> get props {
		return [
				id,
				studentId,
				student1,
				student2,
				student3,
				student4,
				student5,
				student6,
				type,
				createdAt,
				updatedAt,
		];
	}
}
