part of 'detail_bloc.dart';

abstract class DetailState extends Equatable {
  const DetailState();
}

class DetailInitial extends DetailState {
  @override
  List<Object> get props => [];
}

class DetailLoading extends DetailState {
  @override
  List<Object> get props => [];
}

class DetailSuccess extends DetailState {
  final ResponseModel responseModel;

  DetailSuccess({required this.responseModel});

  @override
  List<Object> get props => [responseModel];
}

class DetailError extends DetailState {
  final String error;

  DetailError({required this.error});

  @override
  List<Object> get props => [error];
}
