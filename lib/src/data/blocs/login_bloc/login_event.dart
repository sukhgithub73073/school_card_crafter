part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class DoLoginEvent extends LoginEvent {
  final Map<String, dynamic> map;

  DoLoginEvent({required this.map});

  @override
  List<Object?> get props => [map];
}

class UpdateLoginEvent extends LoginEvent {
  UpdateLoginEvent();

  @override
  List<Object?> get props => [];
}
