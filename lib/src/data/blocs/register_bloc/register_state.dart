part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
}

class RegisterInitial extends RegisterState {
  @override
  List<Object> get props => [];
}
class RegisterLoading extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterSuccess extends RegisterState {
  final ResponseModel userModel ;
  RegisterSuccess({required this.userModel});
  @override
  List<Object> get props => [userModel];
}

class RegisterError extends RegisterState {
  final String error ;
  RegisterError({required this.error});
  @override
  List<Object> get props => [error];
}

