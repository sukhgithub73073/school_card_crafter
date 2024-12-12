part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccess extends LoginState {
  final UserModel userModel;

  LoginSuccess({required this.userModel});

  @override
  List<Object> get props => [userModel];
}

class LoginError extends LoginState {
  final String error;

  LoginError({required this.error});

  @override
  List<Object> get props => [error];
}
