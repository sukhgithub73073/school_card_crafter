part of 'classes_bloc.dart';

abstract class ClassesState extends Equatable {
  const ClassesState();
}

class ClassesInitial extends ClassesState {
  @override
  List<Object> get props => [];
}


class ClassesGetLoading extends ClassesState {
  @override
  List<Object> get props => [];
}
class ClassesGetLoadingDismiss extends ClassesState {
  @override
  List<Object> get props => [];
}

class ClassesGetSuccess extends ClassesState {
  final List<Datum> data;
  ClassesGetSuccess({required this.data});
  @override
  List<Object> get props => [data];
}
class ClassesGetError extends ClassesState {
  final String error ;
  ClassesGetError({required this.error});
  @override
  List<Object> get props => [error];
}




class ClassesCreateLoading extends ClassesState {
  @override
  List<Object> get props => [];
}
class ClassesCreateLoadingDismiss extends ClassesState {
  @override
  List<Object> get props => [];
}

class ClassesCreateSuccess extends ClassesState {
  final List<Datum> list ;
  ClassesCreateSuccess({required this.list});
  @override
  List<Object> get props => [list];
}
class ClassesCreateError extends ClassesState {
  final String error ;
  ClassesCreateError({required this.error});
  @override
  List<Object> get props => [error];
}
