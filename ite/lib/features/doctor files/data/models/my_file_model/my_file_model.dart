import 'package:equatable/equatable.dart';

import 'file.dart';

class MyFileModel extends Equatable {
	final List<File>? files;

	const MyFileModel({this.files});

	factory MyFileModel.fromJson(Map<String, dynamic> json) => MyFileModel(
				files: (json['files'] as List<dynamic>?)
						?.map((e) => File.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'files': files?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props => [files];
}
