import 'package:equatable/equatable.dart';

class Formal extends Equatable {
	final int? id;
	final String? day;
	final String? year;
	final String? lecture;
	final String? doctor;
	final String? place;
	final String? from;
	final String? to;
	final DateTime? createdAt;
	final DateTime? updatedAt;

	const Formal({
		this.id, 
		this.day, 
		this.year, 
		this.lecture, 
		this.doctor, 
		this.place, 
		this.from, 
		this.to, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory Formal.fromJson(Map<String, dynamic> json) => Formal(
				id: json['id'] as int?,
				day: json['day'] as String?,
				year: json['year'] as String?,
				lecture: json['lecture'] as String?,
				doctor: json['doctor'] as String?,
				place: json['place'] as String?,
				from: json['from'] as String?,
				to: json['to'] as String?,
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'day': day,
				'year': year,
				'lecture': lecture,
				'doctor': doctor,
				'place': place,
				'from': from,
				'to': to,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
			};

	@override
	List<Object?> get props {
		return [
				id,
				day,
				year,
				lecture,
				doctor,
				place,
				from,
				to,
				createdAt,
				updatedAt,
		];
	}
}
