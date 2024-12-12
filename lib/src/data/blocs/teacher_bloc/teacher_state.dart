part of 'teacher_bloc.dart';

abstract class TeacherState extends Equatable {
  const TeacherState();
}

class TeacherInitial extends TeacherState {
  @override
  List<Object> get props => [];
}

class TeacherGetLoading extends TeacherState {
  @override
  List<Object> get props => [];
}

class TeacherGetLoadingDismiss extends TeacherState {
  @override
  List<Object> get props => [];
}

class TeacherGetSuccess extends TeacherState {
  final TeachersModel teachersModel;

  final bool loadMore;

  TeacherGetSuccess({
    required this.teachersModel,
    required this.loadMore,
  });

  @override
  List<Object> get props => [teachersModel];
}

class TeacherGetError extends TeacherState {
  final String error;

  TeacherGetError({required this.error});

  @override
  List<Object> get props => [error];
}

class TeacherCreateLoading extends TeacherState {
  @override
  List<Object> get props => [];
}

class TeacherCreateLoadingDismiss extends TeacherState {
  @override
  List<Object> get props => [];
}

class TeacherCreateSuccess extends TeacherState {
  final ResponseModel responseModel;

  TeacherCreateSuccess({required this.responseModel});

  @override
  List<Object> get props => [responseModel];
}

class TeacherCreateError extends TeacherState {
  final String error;

  TeacherCreateError({required this.error});

  @override
  List<Object> get props => [error];
}
