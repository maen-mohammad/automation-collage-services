import 'package:equatable/equatable.dart';

import 'user.dart';

class DoctorLoginModel extends Equatable {
	final String? accessToken;
	final String? tokenType;
	final int? expiresIn;
	final User? user;
	final String? userType;

	const DoctorLoginModel({
		this.accessToken, 
		this.tokenType, 
		this.expiresIn, 
		this.user, 
		this.userType, 
	});

	factory DoctorLoginModel.fromJson(Map<String, dynamic> json) {
		return DoctorLoginModel(
			accessToken: json['access_token'] as String?,
			tokenType: json['token_type'] as String?,
			expiresIn: json['expires_in'] as int?,
			user: json['user'] == null
						? null
						: User.fromJson(json['user'] as Map<String, dynamic>),
			userType: json['user_type'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'access_token': accessToken,
				'token_type': tokenType,
				'expires_in': expiresIn,
				'user': user?.toJson(),
				'user_type': userType,
			};

	@override
	List<Object?> get props {
		return [
				accessToken,
				tokenType,
				expiresIn,
				user,
				userType,
		];
	}
}
