import 'package:equatable/equatable.dart';

import 'hall.dart';

class HallsModel extends Equatable {
	final List<Hall>? halls;

	const HallsModel({this.halls});

	factory HallsModel.fromJson(Map<String, dynamic> json) => HallsModel(
				halls: (json['halls'] as List<dynamic>?)
						?.map((e) => Hall.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'halls': halls?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props => [halls];
}
