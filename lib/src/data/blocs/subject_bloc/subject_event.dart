part of 'subject_bloc.dart';


abstract class SubjectEvent extends Equatable {
  const SubjectEvent();
}

class GetSubjectEvent extends SubjectEvent {
  final Map<String, dynamic> map;

  const GetSubjectEvent({required this.map});

  @override
  List<Object?> get props => [map];
}
class CreateSubjectEvent extends SubjectEvent {
  final Map<String, dynamic> map;

  const CreateSubjectEvent({required this.map});

  @override
  List<Object?> get props => [map];
}
