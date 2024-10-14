import 'package:equatable/equatable.dart';

import 'note.dart';

class NotesModel extends Equatable {
	final List<Note>? notes;

	const NotesModel({this.notes});

	factory NotesModel.fromJson(Map<String, dynamic> json) => NotesModel(
				notes: (json['notes'] as List<dynamic>?)
						?.map((e) => Note.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'notes': notes?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props => [notes];
}
