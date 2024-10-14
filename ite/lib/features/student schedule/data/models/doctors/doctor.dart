import 'package:equatable/equatable.dart';

class Doctor extends Equatable {
	final int? id;
	final String? name;
	final String? email;
	final dynamic emailVerifiedAt;
	final String? specification;
	final dynamic photo;
	final String? phone;
	final DateTime? createdAt;
	final DateTime? updatedAt;

	const Doctor({
		this.id, 
		this.name, 
		this.email, 
		this.emailVerifiedAt, 
		this.specification, 
		this.photo, 
		this.phone, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
				id: json['id'] as int?,
				name: json['name'] as String?,
				email: json['email'] as String?,
				emailVerifiedAt: json['email_verified_at'] as dynamic,
				specification: json['specification'] as String?,
				photo: json['photo'] as dynamic,
				phone: json['phone'] as String?,
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
				'email': email,
				'email_verified_at': emailVerifiedAt,
				'specification': specification,
				'photo': photo,
				'phone': phone,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
			};

	@override
	List<Object?> get props {
		return [
				id,
				name,
				email,
				emailVerifiedAt,
				specification,
				photo,
				phone,
				createdAt,
				updatedAt,
		];
	}
}
