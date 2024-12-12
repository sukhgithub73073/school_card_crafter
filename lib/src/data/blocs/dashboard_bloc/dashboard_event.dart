part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();
}
 class DoLoadList extends DashboardEvent {
  const DoLoadList();
  @override
  List<Object?> get props => [] ;
}

class UpdateIndexEvent extends DashboardEvent {
  final int index ;
  const UpdateIndexEvent({required this.index});
  @override
  List<Object?> get props => [index] ;
}