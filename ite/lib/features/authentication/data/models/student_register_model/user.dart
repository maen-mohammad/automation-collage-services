import 'package:equatable/equatable.dart';

class User extends Equatable {
	final String? name;
	final String? email;
	final String? specification;
	final String? phone;
	final String? collageNumber;
	final dynamic photo;
	final DateTime? updatedAt;
	final DateTime? createdAt;
	final int? id;

	const User({
		this.name, 
		this.email, 
		this.specification, 
		this.phone, 
		this.collageNumber, 
		this.photo, 
		this.updatedAt, 
		this.createdAt, 
		this.id, 
	});

	factory User.fromJson(Map<String, dynamic> json) => User(
				name: json['name'] as String?,
				email: json['email'] as String?,
				specification: json['specification'] as String?,
				phone: json['phone'] as String?,
				collageNumber: json['collage_number'] as String?,
				photo: json['photo'] as dynamic,
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				id: json['id'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'name': name,
				'email': email,
				'specification': specification,
				'phone': phone,
				'collage_number': collageNumber,
				'photo': photo,
				'updated_at': updatedAt?.toIso8601String(),
				'created_at': createdAt?.toIso8601String(),
				'id': id,
			};

	@override
	List<Object?> get props {
		return [
				name,
				email,
				specification,
				phone,
				collageNumber,
				photo,
				updatedAt,
				createdAt,
				id,
		];
	}
}
