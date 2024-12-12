part of 'disability_bloc.dart';

sealed class DisabilityEvent extends Equatable {
  const DisabilityEvent();
}

class GetDisabilityEvent extends DisabilityEvent {
  final Map<String, dynamic> map;

  const GetDisabilityEvent({required this.map});

  @override
  List<Object?> get props => [map];
}
