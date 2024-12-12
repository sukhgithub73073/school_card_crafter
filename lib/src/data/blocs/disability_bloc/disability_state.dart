part of 'disability_bloc.dart';

sealed class DisabilityState extends Equatable {
  const DisabilityState();
}

final class DisabilityInitial extends DisabilityState {
  @override
  List<Object> get props => [];
}

final class DisabilityLoading extends DisabilityState {
  @override
  List<Object> get props => [];
}

final class DisabilityLoaded extends DisabilityState {
  final List<DropListModel> list;

  DisabilityLoaded({required this.list});

  @override
  List<Object> get props => [list];
}

final class DisabilityError extends DisabilityState {
  final String error;

  DisabilityError({required this.error});

  @override
  List<Object> get props => [error];
}
