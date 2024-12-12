part of 'student_bloc.dart';


abstract class StudentEvent extends Equatable {
  const StudentEvent();
}

class GetStudentEvent extends StudentEvent {
  final Map<String, dynamic> map;

  const GetStudentEvent({required this.map});

  @override
  List<Object?> get props => [map];
}

class LoadMoreStudentEvent extends StudentEvent {
  final Map<String, dynamic> map;

  const LoadMoreStudentEvent({required this.map});

  @override
  List<Object?> get props => [map];
}


class ClearStudentEvent extends StudentEvent {
  final Map<String, dynamic> map;

  const ClearStudentEvent({required this.map});

  @override
  List<Object?> get props => [map];
}

class SearchStudentEvent extends StudentEvent {
  final Map<String, dynamic> map;

  const SearchStudentEvent({required this.map});

  @override
  List<Object?> get props => [map];
}
class CreateStudentEvent extends StudentEvent {
  final Map<String, dynamic> map;

  const CreateStudentEvent({required this.map});

  @override
  List<Object?> get props => [map];
}

class DeleteStudentEvent extends StudentEvent {
  final Map<String, dynamic> map;

  const DeleteStudentEvent({required this.map});

  @override
  List<Object?> get props => [map];
}