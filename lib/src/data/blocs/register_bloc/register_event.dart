part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class DoRegisterEvent extends RegisterEvent {
  final Map<String, dynamic> map;

  const DoRegisterEvent({required this.map});

  @override
  List<Object?> get props => [map];
}

class GetSerialNoEvent extends RegisterEvent {
  const GetSerialNoEvent();

  @override
  List<Object?> get props => [];
}
