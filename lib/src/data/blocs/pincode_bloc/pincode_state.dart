part of 'pincode_bloc.dart';

abstract class PincodeState extends Equatable {
  const PincodeState();
}

class PincodeInitial extends PincodeState {
  @override
  List<Object> get props => [];
}

class PincodeLoading extends PincodeState {
  @override
  List<Object> get props => [];
}

class PincodeSuccess extends PincodeState {
  final ResponseModel responseModel;

  PincodeSuccess({required this.responseModel});

  @override
  List<Object> get props => [responseModel];
}

class PincodeError extends PincodeState {
  final String error;

  PincodeError({required this.error});

  @override
  List<Object> get props => [error];
}
