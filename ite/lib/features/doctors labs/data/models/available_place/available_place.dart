import 'package:equatable/equatable.dart';

import 'available_hall.dart';
import 'available_lab.dart';

class AvailablePlace extends Equatable {
	final List<AvailableLab>? availableLabs;
	final List<AvailableHall>? availableHalls;

	const AvailablePlace({this.availableLabs, this.availableHalls});

	factory AvailablePlace.fromJson(Map<String, dynamic> json) {
		return AvailablePlace(
			availableLabs: (json['available_labs'] as List<dynamic>?)
						?.map((e) => AvailableLab.fromJson(e as Map<String, dynamic>))
						.toList(),
			availableHalls: (json['available_halls'] as List<dynamic>?)
						?.map((e) => AvailableHall.fromJson(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toJson() => {
				'available_labs': availableLabs?.map((e) => e.toJson()).toList(),
				'available_halls': availableHalls?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props => [availableLabs, availableHalls];
}
