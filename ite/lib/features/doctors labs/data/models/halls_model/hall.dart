import 'package:equatable/equatable.dart';

class Hall extends Equatable {
	final int? id;
	final String? name;
	final String? projector;
	final String? descreption;
	final DateTime? createdAt;
	final DateTime? updatedAt;

	const Hall({
		this.id, 
		this.name, 
		this.projector, 
		this.descreption, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory Hall.fromJson(Map<String, dynamic> json) => Hall(
				id: json['id'] as int?,
				name: json['name'] as String?,
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
				projector,
				descreption,
				createdAt,
				updatedAt,
		];
	}
}
