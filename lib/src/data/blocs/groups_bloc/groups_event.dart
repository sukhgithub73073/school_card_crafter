part of 'groups_bloc.dart';

abstract class GroupsEvent extends Equatable {
  const GroupsEvent();
}

class GetGroupsEvent extends GroupsEvent {
  final Map<String, dynamic> map;

  const GetGroupsEvent({required this.map});

  @override
  List<Object?> get props => [map];
}
class AddGroupsEvent extends GroupsEvent {
  final Map<String, dynamic> map;

  const AddGroupsEvent({required this.map});

  @override
  List<Object?> get props => [map];
}
