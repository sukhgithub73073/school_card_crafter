part of 'teacher_bloc.dart';

abstract class TeacherEvent extends Equatable {
  const TeacherEvent();
}

class GetTeacherEvent extends TeacherEvent {
  final Map<String, dynamic> map;

  const GetTeacherEvent({required this.map});

  @override
  List<Object?> get props => [map];
}

class LoadMoreTeacherEvent extends TeacherEvent {
  final Map<String, dynamic> map;

  const LoadMoreTeacherEvent({required this.map});

  @override
  List<Object?> get props => [map];
}

class CreateTeacherEvent extends TeacherEvent {
  final Map<String, dynamic> map;

  const CreateTeacherEvent({required this.map});

  @override
  List<Object?> get props => [map];
}
