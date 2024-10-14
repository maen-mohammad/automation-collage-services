import 'package:equatable/equatable.dart';

import 'request.dart';

class TransactionModel extends Equatable {
	final List<Request>? requests;

	const TransactionModel({this.requests});

	factory TransactionModel.fromJson(Map<String, dynamic> json) {
		return TransactionModel(
			requests: (json['requests'] as List<dynamic>?)
						?.map((e) => Request.fromJson(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toJson() => {
				'requests': requests?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props => [requests];
}
