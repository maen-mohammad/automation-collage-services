part of 'student_register_cubit.dart';

sealed class StudentRegisterState extends Equatable {
  const StudentRegisterState();

  @override
  List<Object> get props => [];
}

final class StudentRegisterInitial extends StudentRegisterState {}
final class StudentRegisterLoading extends StudentRegisterState {}
final class StudentRegisterSuccess extends StudentRegisterState {
     final StudentRegisterModel doctor;

 const StudentRegisterSuccess(this.doctor);
}
final class StudentRegisterFailure extends StudentRegisterState {
  final String errmessage;

  const StudentRegisterFailure(this.errmessage);
}
