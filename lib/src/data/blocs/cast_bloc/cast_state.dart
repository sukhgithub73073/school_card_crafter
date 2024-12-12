part of 'cast_bloc.dart';

sealed class CastState extends Equatable {
  const CastState();
}

final class CastInitial extends CastState {
  @override
  List<Object> get props => [];
}

final class CastLoading extends CastState {
  @override
  List<Object> get props => [];
}

final class CastLoaded extends CastState {
  final CasteModel casteModel;

  CastLoaded({required this.casteModel});

  @override
  List<Object> get props => [casteModel];
}

final class CastError extends CastState {
  final String error;

  CastError({required this.error});

  @override
  List<Object> get props => [error];
}
