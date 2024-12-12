part of 'update_bloc.dart';

sealed class UpdateEvent extends Equatable {
  const UpdateEvent();
}

class UpdateStudentEvent extends UpdateEvent {
  final Map<String, dynamic> map;

  const UpdateStudentEvent({required this.map});

  @override
  List<Object?> get props => [map];
}
class UpdateStaffEvent extends UpdateEvent {
  final Map<String, dynamic> map;

  const UpdateStaffEvent({required this.map});

  @override
  List<Object?> get props => [map];
}
