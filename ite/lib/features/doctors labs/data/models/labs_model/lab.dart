import 'package:equatable/equatable.dart';

class Lab extends Equatable {
	final int? id;
	final String? name;
	final int? pcNumber;
	final String? projector;
	final String? descreption;
	final DateTime? createdAt;
	final DateTime? updatedAt;

	const Lab({
		this.id, 
		this.name, 
		this.pcNumber, 
		this.projector, 
		this.descreption, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory Lab.fromJson(Map<String, dynamic> json) => Lab(
				id: json['id'] as int?,
				name: json['name'] as String?,
				pcNumber: json['pc_number'] as int?,
				projector: json['projector'] as String?,
				descreption: json['descreption'] as String?,
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'pc_number': pcNumber,
				'projector': projector,
				'descreption': descreption,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
			};

	@override
	List<Object?> get props {
		return [
				id,
				name,
				pcNumber,
				projector,
				descreption,
				createdAt,
				updatedAt,
		];
	}
}
