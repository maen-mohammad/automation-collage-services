import 'package:equatable/equatable.dart';

import 'formal.dart';

class MyProgram extends Equatable {
	final List<Formal>? formal;

	const MyProgram({this.formal});

	factory MyProgram.fromJson(Map<String, dynamic> json) => MyProgram(
				formal: (json['formal'] as List<dynamic>?)
						?.map((e) => Formal.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'formal': formal?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props => [formal];
}
