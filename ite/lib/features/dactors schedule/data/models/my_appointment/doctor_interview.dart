import 'package:equatable/equatable.dart';

import 'group.dart';

class DoctorInterview extends Equatable {
	final int? id;
	final int? doctorId;
	final int? studentId;
	final int? groupId;
	final String? from;
	final String? to;
	final String? date;
	final String? goal;
	final String? title;
	final dynamic reason;
	final dynamic note;
	final String? state;
	final DateTime? createdAt;
	final DateTime? updatedAt;
	final Group? group;

	const DoctorInterview({
		this.id, 
		this.doctorId, 
		this.studentId, 
		this.groupId, 
		this.from, 
		this.to, 
		this.date, 
		this.goal, 
		this.title, 
		this.reason, 
		this.note, 
		this.state, 
		this.createdAt, 
		this.updatedAt, 
		this.group, 
	});

	factory DoctorInterview.fromJson(Map<String, dynamic> json) {
		return DoctorInterview(
			id: json['id'] as int?,
			doctorId: json['doctor_id'] as int?,
			studentId: json['student_id'] as int?,
			groupId: json['group_id'] as int?,
			from: json['from'] as String?,
			to: json['to'] as String?,
			date: json['date'] as String?,
			goal: json['goal'] as String?,
			title: json['title'] as String?,
			reason: json['reason'] as dynamic,
			note: json['note'] as dynamic,
			state: json['state'] as String?,
			createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
			updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
			group: json['group'] == null
						? null
						: Group.fromJson(json['group'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toJson() => {
				'id': id,
				'doctor_id': doctorId,
				'student_id': studentId,
				'group_id': groupId,
				'from': from,
				'to': to,
				'date': date,
				'goal': goal,
				'title': title,
				'reason': reason,
				'note': note,
				'state': state,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
				'group': group?.toJson(),
			};

	@override
	List<Object?> get props {
		return [
				id,
				doctorId,
				studentId,
				groupId,
				from,
				to,
				date,
				goal,
				title,
				reason,
				note,
				state,
				createdAt,
				updatedAt,
				group,
		];
	}
}
