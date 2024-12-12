part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();
}

class DashboardInitial extends DashboardState {
  @override
  List<Object> get props => [];

}
class DashboardLoading extends DashboardState {
  @override
  List<Object> get props => [];

}
class DashboardSuccess extends DashboardState {
  final List<Widget> widgetList ;
  final int selectedIndex ;
  DashboardSuccess({required this.widgetList, required this.selectedIndex});

  @override
  List<Object> get props => [widgetList];

}

class DashboardError extends DashboardState {
  final String error ;
  DashboardError(this.error);
  @override
  List<Object> get props => [error];

}