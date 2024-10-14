import 'package:equatable/equatable.dart';

import 'doctor_file.dart';

class FilesModel extends Equatable {
	final List<DoctorFile>? doctorFiles;

	const FilesModel({this.doctorFiles});

	factory FilesModel.fromJson(Map<String, dynamic> json) => FilesModel(
				doctorFiles: (json['doctor_files'] as List<dynamic>?)
						?.map((e) => DoctorFile.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'doctor_files': doctorFiles?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props => [doctorFiles];
}
