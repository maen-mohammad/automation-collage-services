import 'package:equatable/equatable.dart';

import 'lab.dart';

class LabsModel extends Equatable {
	final List<Lab>? labs;

	const LabsModel({this.labs});

	factory LabsModel.fromJson(Map<String, dynamic> json) => LabsModel(
				labs: (json['labs'] as List<dynamic>?)
						?.map((e) => Lab.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'labs': labs?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props => [labs];
}
