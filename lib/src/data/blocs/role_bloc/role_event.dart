part of 'role_bloc.dart';

abstract class RoleEvent extends Equatable {
  const RoleEvent();
}

class ChangeRoleEvent extends RoleEvent {
  final RoleEnum roleEnum;

  const ChangeRoleEvent({required this.roleEnum});

  @override
  List<Object?> get props => [roleEnum];
}

class UpdateRoleEventData extends RoleEvent {
  final RoleEnum roleEnum;
  final ResponseModel responseModel;

  const UpdateRoleEventData(
      {required this.roleEnum, required this.responseModel});

  @override
  List<Object?> get props => [roleEnum, responseModel];
}
