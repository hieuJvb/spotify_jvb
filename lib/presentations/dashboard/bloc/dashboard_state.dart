part of 'dashboard_cubit.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardTabChanged extends DashboardState {
  final int index;

  const DashboardTabChanged(this.index);

  @override
  List<Object> get props => [index];
}
