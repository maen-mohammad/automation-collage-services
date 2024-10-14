import 'package:equatable/equatable.dart';

class Note extends Equatable {
	final String? note;

	const Note({this.note});

	factory Note.fromJson(Map<String, dynamic> json) => Note(
				note: json['note'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'note': note,
			};

	@override
	List<Object?> get props => [note];
}
