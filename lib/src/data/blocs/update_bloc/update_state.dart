part of 'update_bloc.dart';

sealed class UpdateState extends Equatable {
  const UpdateState();
}

final class UpdateInitial extends UpdateState {
  @override
  List<Object> get props => [];
}

final class UpdateLoading extends UpdateState {
  @override
  List<Object> get props => [];
}

final class UpdateSuccess extends UpdateState {
  @override
  List<Object> get props => [];
}

final class UpdateError extends UpdateState {
  final String error;

  UpdateError({required this.error});

  @override
  List<Object> get props => [];
}
