part of 'subject_bloc.dart';


abstract class SubjectState extends Equatable {
  const SubjectState();
}

class SubjectInitial extends SubjectState {
  @override
  List<Object> get props => [];
}

class SubjectGetLoading extends SubjectState {
  @override
  List<Object> get props => [];
}
class SubjectGetLoadingDismiss extends SubjectState {
  @override
  List<Object> get props => [];
}

class SubjectGetSuccess extends SubjectState {
  final ResponseModel responseModel;

  SubjectGetSuccess({required this.responseModel});

  @override
  List<Object> get props => [responseModel];
}

class SubjectGetError extends SubjectState {
  final String error;

  SubjectGetError({required this.error});

  @override
  List<Object> get props => [error];
}



class SubjectCreateLoading extends SubjectState {
  @override
  List<Object> get props => [];
}
class SubjectCreateLoadingDismiss extends SubjectState {
  @override
  List<Object> get props => [];
}

class SubjectCreateSuccess extends SubjectState {
  final ResponseModel responseModel;

  SubjectCreateSuccess({required this.responseModel});

  @override
  List<Object> get props => [responseModel];
}

class SubjectCreateError extends SubjectState {
  final String error;

  SubjectCreateError({required this.error});

  @override
  List<Object> get props => [error];
}
