import 'package:equatable/equatable.dart';

class Interview extends Equatable {
	final String? groupId;
	final String? doctorId;
	final String? goal;
	final String? title;
	final String? reason;
	final int? studentId;
	final DateTime? updatedAt;
	final DateTime? createdAt;
	final int? id;

	const Interview({
		this.groupId, 
		this.doctorId, 
		this.goal, 
		this.title, 
		this.reason, 
		this.studentId, 
		this.updatedAt, 
		this.createdAt, 
		this.id, 
	});

	factory Interview.fromJson(Map<String, dynamic> json) => Interview(
				groupId: json['group_id'] as String?,
				doctorId: json['doctor_id'] as String?,
				goal: json['goal'] as String?,
				title: json['title'] as String?,
				reason: json['reason'] as String?,
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
				'group_id': groupId,
				'doctor_id': doctorId,
				'goal': goal,
				'title': title,
				'reason': reason,
				'student_id': studentId,
				'updated_at': updatedAt?.toIso8601String(),
				'created_at': createdAt?.toIso8601String(),
				'id': id,
			};

	@override
	List<Object?> get props {
		return [
				groupId,
				doctorId,
				goal,
				title,
				reason,
				studentId,
				updatedAt,
				createdAt,
				id,
		];
	}
}
