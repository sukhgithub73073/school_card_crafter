part of 'student_bloc.dart';

abstract class StudentState extends Equatable {
  const StudentState();
}

class StudentInitial extends StudentState {
  @override
  List<Object> get props => [];
}

class StudentGetLoading extends StudentState {
  @override
  List<Object> get props => [];
}

class StudentGetLoadingDismiss extends StudentState {
  @override
  List<Object> get props => [];
}

class StudentGetSuccess extends StudentState {
  final StudentsModel studentsModel ;
  final bool loadMore;

  StudentGetSuccess({
    required this.studentsModel,
    required this.loadMore,
  });


  @override
  List<Object> get props => [studentsModel];
}

class StudentGetError extends StudentState {
  final String error;

  StudentGetError({required this.error});

  @override
  List<Object> get props => [error];
}

class StudentCreateLoading extends StudentState {
  @override
  List<Object> get props => [];
}

class StudentCreateLoadingDismiss extends StudentState {
  @override
  List<Object> get props => [];
}

class StudentCreateSuccess extends StudentState {
  final ResponseModel responseModel;

  StudentCreateSuccess({required this.responseModel});

  @override
  List<Object> get props => [responseModel];
}

class StudentCreateError extends StudentState {
  final String error;

  StudentCreateError({required this.error});

  @override
  List<Object> get props => [error];
}
